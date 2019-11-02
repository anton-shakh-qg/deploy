user: ocdskit-web
name: ocdskit-web
apache:
  https: force
  serveraliases: []
  servername: toucan.open-contracting.org
  assets_base_url: ''
git:
  url: https://github.com/open-contracting/toucan.git
  branch: master
django:
  app: ocdstoucan
  compilemessages: True
  env:
    DEBUG: 'False'
    LANG: en_US.utf8
    ALLOWED_HOSTS: toucan.open-contracting.org
