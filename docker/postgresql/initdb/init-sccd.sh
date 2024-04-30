#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER docker WITH PASSWORD 'docker';
    CREATE DATABASE sccd_corporate;
    GRANT ALL PRIVILEGES ON DATABASE sccd_corporate TO docker;
EOSQL
