#!/bin/bash
set -e

POSTGRES_SCHEMAS=$POSTGRES_SCHEMAS
SCHEMAS=${POSTGRES_SCHEMAS//[[:blank:]]/}

IFS=',' read -r -a array <<< $SCHEMAS

for element in "${array[@]}"
do
echo "Creating $element Schema.";
psql -v ON_ERROR_STOP=1 --dbname="${POSTGRES_DB}" --username "${POSTGRES_USER}" <<-EOSQL
CREATE SCHEMA IF NOT EXISTS $element AUTHORIZATION "${POSTGRES_USER}" ;
EOSQL
done