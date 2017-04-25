FROM postgres:9.6.2

# Custom initialization scripts
ADD ./scripts/create_schema.sh /docker-entrypoint-initdb.d/