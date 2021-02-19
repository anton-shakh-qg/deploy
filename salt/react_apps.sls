{% from 'lib.sls' import apache %}
{% set timestamp = salt['cmd.run']('date +%Y-%m-%d_%H:%M:%S') %}

include:
  - apache
  - apache.modules.rewrite

{% for name, entry in pillar.react_apps.items() %}

# A user might run multiple apps, so the user is not created here.
{% set userdir = '/home/' + entry.user %}
{% set build_asset_base = userdir + '/react-asset' %}
{% set build_asset_dir = build_asset_base + '/build' %}
{% set directory = userdir + '/' + entry.git.target %}
{% set build_dir = userdir + '/' + entry.git.target + '/build' %}
{% set appdir = userdir + '/web/current' %}
{% set context = {'name': name, 'entry': entry, 'appdir': appdir} %}

{{ entry.git.url }}:
  git.latest:
    - name: {{ entry.git.url }}
    - user: {{ entry.user }}
    - force_fetch: True
    - force_reset: True
    - branch: {{ entry.git.branch }}
    - rev: {{ entry.git.branch }}
    - target: {{ directory }}
    - require:
      - pkg: git
      - user: {{ entry.user }}_user_exists

{% if 'apache' in entry %}
{{ apache(entry.git.target, entry.apache, context=context) }}
{% endif %}

{{ directory }}/.env:
  file.copy:
    - source: {{ directory }}/.env.salt

{{ userdir }}-yarn-install:
  cmd.run:
    - name: yarn
    - runas: {{ entry.user }}
    - cwd: {{ directory }}
    - require:
      - pkg: git
    - onchanges:
      - git: {{ entry.git.url }}

{{ userdir }}-yarn-build:
  cmd.run:
    - name: yarn build
    - env: {{ entry.env|yaml }}
    - runas: {{ entry.user }}
    - cwd: {{ directory }}
    - require:
      - pkg: git
    - onchanges:
      - git: {{ entry.git.url }}

{% if if salt['pillar.get']('ver_txt:enable'] %}
{{ build_dir }}/ver.txt:
  file.managed:
    - contents: "branch: {{ entry.git.branch }} || commit_hash: {{ salt['cmd.shell']('cd ' + directory + '&& git rev-parse --verify HEAD') }} || time: {{ timestamp }}"
{% endif %}{# ver txt #}

{{ directory }}/.htaccess:
  file.managed:
    - name: {{ build_dir }}/.htaccess
    - source: {{ directory }}/.htaccess

{{ build_dir }}/.htaccess:
  file.replace:
    - name: {{ build_dir }}/.htaccess
    - pattern: 'PRERENDER_IO_TOKEN'
    - repl: '{{ entry.prerender_token }}'

{{ build_asset_dir }}-update:
  cmd.run:
    - name: rm -rf {{ build_asset_base }} && mkdir -p {{ build_asset_base }} && mv build {{ build_asset_base }}
    - runas: {{ entry.user }}
    - cwd: {{ directory }}

{{ appdir }}:
  file.symlink:
    - target: {{ build_asset_base }}
    - makedirs: True
    - runas: {{ entry.user }}
    - require:
      - cmd: {{ build_asset_dir }}-update
    # The symlink must be created before Apache starts.
    - require_in:
      - service: apache2

{% endfor %}
