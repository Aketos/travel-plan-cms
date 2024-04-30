#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER docker WITH PASSWORD 'docker';
    CREATE DATABASE travel_plan_strapi;
    GRANT ALL PRIVILEGES ON DATABASE travel_plan_strapi TO docker;
EOSQL
