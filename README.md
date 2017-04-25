# docker-postgres-image

### About

Docker file that creates a postgres image, based on and extending postgres:9.6.2 in docker library, allowing one or more schemas to be created in database

The only difference between this image and postgres:9.6.2 is the addition of a POSTGRES_SCHEMAS variable which takes a comma-delimited list of schemas names. ex: schema1, schema2, schema2.  These schemas are then created inside the POSTGRES_DB that you specify, authorized with the POSGRES_USER and POSTGRES_PASSWORD

https://github.com/docker-library/postgres/blob/3d4e5e9f64124b72aa80f80e2635aff0545988c6/9.6/Dockerfile

### Getting Started

1. Clone repository
2. Create postgres image with docker
    - docker build -t postgres:<tag> .
3. Update services: in docker-compose file
    ```services:  
      database:
        image: "postgres:<tag>"
        environment:
          POSTGRES_USER: <username>
          POSTGRES_PASSWORD: <password>
          POSTGRES_DB: <database name>
          POSTGRES_SCHEMAS: <comma-delimited list of schemas>
        ports:
          - "5432:5432"