if [ -z "$PROFILE_NAME" ]; then
    echo "\$PROFILE_NAME is not set, exiting."
    exit
fi

echo "Create a private key from the environment variable..."
echo "$PRIVATE_KEY" | tr '#' '\n' | tr '_' ' ' > id_rsa
chmod 600 id_rsa

echo "Add the host key for the remote server..."
echo 'staging.standard.open-contracting.org ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDk8O226B/sYkPqyHdNBdjUFCEpT9IMdUxgFXEOtlPq1QnwTgHY76PsaOin7KhJcBrm8RAOuzoOIrKfgUJjXoxCtx1edp594tD8OChF5koHyO8YkQVlJmH8LrV16txsxokfh2F31ofRIVMk+TXiEfvR4+WehqeR24TwnXzlLIv1KfMJB7znTDdwqZS3uONKjlNNzSBNNIvCZ4WTI6etVlCzQgv4HL9QllKGfk1ctDuwOgsGPMT8f5NNPhI/z7kZkNbcrHJ5Mo6ZtF26qFmZ3Hy6vxJAQ2C4/x/Zemtb0MbIvI4Qlghh3bl5lER1rB54oMg+DidJ36qMrbqEtZxrBwvP' >> ~/.ssh/known_hosts

echo "Get LFTP binary if necessary..."
if hash lftp 2>/dev/null; then
    LFTP=lftp
else
    wget "https://raw.githubusercontent.com/open-contracting/deploy/master/lftp"
    chmod a+x ./lftp
    LFTP=./lftp
fi

# Make a test SSH connection, as LFTP doesn't output key errors well.
# ssh -i id_rsa ocds-docs@staging.standard.open-contracting.org

echo "Copy the built files to the remote server..."
# See http://lftp.yar.ru/lftp-man.html
$LFTP -c "set sftp:connect-program \"ssh -i id_rsa\"; connect sftp://ocds-docs:xxx@staging.standard.open-contracting.org; mirror -eRv build web/profiles/$PROFILE_NAME/$TRAVIS_BRANCH"

echo "Update the search index..."
curl "https://standard-search.open-contracting.org/v1/index_ocds?secret=${SEARCH_SECRET}&version=profiles%2F{$PROFILE_NAME}%2F${TRAVIS_BRANCH}&langs=${LANGS}"
