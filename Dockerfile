FROM postgres:latest
ENV POSTGRES_USER=w3user
ENV POSTGRES_PASSWORD=w3password
ENV POSTGRES_DB=w3db
COPY W3School_dump_DB.sql /docker-entrypoint-initdb.d/
