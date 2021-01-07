# Groups
# https://wiki.postgresql.org/images/d/d1/Managing_rights_in_postgresql.pdf

readonly:
  postgres_group.present:
    - name: readonly
    - require:
      - service: postgresql

# Users

ocdskfp:
  postgres_user.present:
    - name: ocdskfp
    - password: {{ pillar.postgres.ocdskfp.password }}
    - require:
      - service: postgresql

# Databases

ocdskingfisherprocess:
  postgres_database.present:
    - name: ocdskingfisherprocess
    - owner: ocdskfp
    - require:
      - postgres_user: ocdskfp

# Extensions

# https://github.com/open-contracting/deploy/issues/117
# https://github.com/open-contracting/deploy/issues/237
{% set extensions = ['tablefunc', 'fuzzystrmatch', 'pg_trgm'] %}

{% for extension in extensions %}
{{ extension }}:
  postgres_extension.present:
    - name: {{ extension }}
    - if_not_exists: True
    - maintenance_db: ocdskingfisherprocess
    - require:
      - postgres_database: ocdskingfisherprocess
{% endfor %}

# REVOKE privileges
# https://www.postgresql.org/docs/current/sql-revoke.html

revoke public database privileges:
  postgres_privileges.absent:
    - name: public
    - privileges:
      - ALL
    - object_type: database
    - object_name: ocdskingfisherprocess
    - maintenance_db: ocdskingfisherprocess
    - require:
      - postgres_database: ocdskingfisherprocess

revoke public schema privileges:
  postgres_privileges.absent:
    - name: public
    - privileges:
      - ALL
    - object_type: schema
    - object_name: public
    - maintenance_db: ocdskingfisherprocess
    - require:
      - postgres_database: ocdskingfisherprocess

# GRANT privileges
# https://www.postgresql.org/docs/current/sql-grant.html
# https://www.postgresql.org/docs/current/ddl-priv.html

grant public database privileges:
  postgres_privileges.present:
    - name: public
    - privileges:
      - CONNECT
    - object_type: database
    - object_name: ocdskingfisherprocess
    - grant_option: False
    - maintenance_db: ocdskingfisherprocess
    - require:
      - postgres_privileges: revoke public database privileges

grant readonly schema privileges:
  postgres_privileges.present:
    - name: readonly
    - privileges:
      - USAGE
    - object_type: schema
    - object_name: public
    - grant_option: False
    - maintenance_db: ocdskingfisherprocess
    - require:
      - postgres_database: ocdskingfisherprocess

grant readonly table privileges:
  postgres_privileges.present:
    - name: readonly
    - privileges:
      - SELECT
    - object_type: table
    - object_name: ALL
    - prepend: public
    - grant_option: False
    - maintenance_db: ocdskingfisherprocess
    - require:
      - postgres_database: ocdskingfisherprocess

# https://github.com/saltstack/salt/pull/56808
alter readonly default privileges:
  cmd.run:
    - name: psql -c "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly;" ocdskingfisherprocess
    - runas: postgres
    - require:
      - postgres_group: readonly
      - postgres_database: ocdskingfisherprocess
