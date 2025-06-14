FROM mysql:8.0-debian

RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# Copy the init scripts into the container's init folder
COPY ./init_auth_schema.sql /docker-entrypoint-initdb.d/init_auth_schema.sql
COPY ./init_admin_db.sh /docker-entrypoint-initdb.d/init_admin_db.sh

# Make sure the shell script is executable
RUN chmod +x /docker-entrypoint-initdb.d/init_admin_db.sh