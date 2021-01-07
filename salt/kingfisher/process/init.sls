{% from 'lib.sls' import create_user %}

include:
  - python_apps
  - kingfisher.process.database

{% set entry = pillar.python_apps.kingfisher_process %}
{% set userdir = '/home/' + entry.user %}
{% set directory = userdir + '/' + entry.git.target %}

{% set summarize = pillar.python_apps.kingfisher_summarize %}
{% set summarize_directory = '/home/' + summarize.user + '/' + summarize.git.target %}

{{ create_user(entry.user, authorized_keys=pillar.ssh.kingfisher) }}

kingfisher-process-prerequisites:
  pkg.installed:
    - pkgs:
      - libpq-dev # https://www.psycopg.org/install/
      - libyajl-dev # OCDS Kit performance
      # To assist analysts with manual loads.
      - jq
      - unrar

####################
# Configuration
####################

{{ userdir }}/.pgpass:
  file.managed:
    - source: salt://postgres/files/kingfisher-process.pgpass
    - template: jinja
    - user: {{ entry.user }}
    - group: {{ entry.user }}
    - mode: 400
    - require:
      - user: {{ entry.user }}_user_exists

####################
# App installation
####################

{{ directory }}-install:
  cmd.run:
    - name: . .ve/bin/activate; python ocdskingfisher-process-cli upgrade-database
    - runas: {{ entry.user }}
    - cwd: {{ directory }}
    - require:
      - cmd: {{ directory }}-requirements
      - file: {{ userdir }}/.pgpass
      - file: {{ userdir }}/.config/ocdskingfisher-process/config.ini
      - postgres_database: ocdskingfisherprocess
    - onchanges:
      - git: {{ pillar.python_apps.kingfisher_process.git.url }}

####################
# Cron jobs
####################

# This is to have eight workers at once.
cd {{ directory }}; . .ve/bin/activate; python ocdskingfisher-process-cli --quiet process-redis-queue --runforseconds 3540 > /dev/null:
  cron.present:
    - identifier: OCDS_KINGFISHER_PROCESS_REDIS_QUEUE
    - user: {{ entry.user }}
    - minute: 0,5,15,20,30,35,45,50

cd {{ directory }}; . .ve/bin/activate; python ocdskingfisher-process-cli --quiet process-redis-queue-collection-store-finished --runforseconds 3540:
  cron.present:
    - identifier: OCDS_KINGFISHER_PROCESS_REDIS_QUEUE_COLLECTION_STORE_FINISHED
    - user: {{ entry.user }}
    - minute: 0

# This process is a backup; this work should be done by workers on the Redis que.
# So run it once per night. It also takes a while to check all processes, so run for 8 hours.
cd {{ directory }}; . .ve/bin/activate; python ocdskingfisher-process-cli --quiet check-collections --runforseconds 28800:
  cron.present:
    - identifier: OCDS_KINGFISHER_SCRAPE_CHECK_COLLECTIONS
    - user: {{ entry.user }}
    - minute: 0
    - hour: 1

# It takes just under 2 hours to do a full run at the moment, so run for 3 hours.
cd {{ directory }}; . .ve/bin/activate; python ocdskingfisher-process-cli --quiet transform-collections --threads 10 --runforseconds 10800:
  cron.present:
    - identifier: OCDS_KINGFISHER_SCRAPE_TRANSFORM_COLLECTIONS
    - user: {{ entry.user }}
    - hour: 0,3,6,9,12,15,18,21
    - minute: 30

cd {{ directory }}; . .ve/bin/activate; python ocdskingfisher-process-cli --quiet delete-collections:
  cron.present:
    - identifier: OCDS_KINGFISHER_SCRAPE_DELETE_COLLECTIONS
    - user: {{ entry.user }}
    - minute: 0
    - hour: 2
    - dayweek: 5

####################
# Utilities
####################

kingfisher-process-pipinstall:
  pkg.installed:
    - name: python3-pip
  pip.installed:
    - upgrade: True
    - user: {{ entry.user }}
    - requirements: salt://kingfisher/files/pipinstall.txt
    - bin_env: /usr/bin/pip3
    - require:
      - pkg: kingfisher-process-pipinstall

kingfisher-process-pip-path:
  file.append:
    - name: {{ userdir }}/.bashrc
    - text: "export PATH=\"{{ userdir }}/.local/bin/:$PATH\""
