# Defines which states should be applied for each target and is used by the state.apply command.

base:
  '*':
    - core

  'ocds-docs-staging':
    - prometheus-client-apache
    - ocds-docs-staging
    - tinyproxy

  'ocds-docs-live':
    - prometheus-client-apache
    - ocds-docs-live
    - ocds-legacy

  'standard-search':
    - prometheus-client-apache
    - standard-search

  'ocds-redash':
    # This server does not have ocds-redash because the redash on this server is installed via an old method that does not work any more.
    # The ocds-redash salt stuff is the new method  and we don't want to apply the new method to this old server
    - prometheus-client-nginx

  'ocds-redash2':
    - ocds-redash

  'toucan':
    - toucan
    - prometheus-client-apache

  'ocds-kingfisher-archive':
    - ocdskingfisher
    - ocdskingfisheranalyse
    - ocdskingfisherarchiveonarchive
    - prometheus-client-apache

  'cove-live*':
    - cove
    - prometheus-client-apache

  'kingfisher-process*':
    - postgres11
    - ocdskingfisher
    - ocdskingfisherarchiveonprocess
    - ocdskingfisherscrape
    - ocdskingfisherprocess
    - ocdskingfisheranalyse
    - prometheus-client-apache

  'prometheus':
    - prometheus-client-apache
    - prometheus-server
