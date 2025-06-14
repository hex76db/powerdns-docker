#!/bin/bash

# Prepare the SQL with envsubst
SQL=$(envsubst <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE2}\`;
CREATE USER '${MYSQL_USER2}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD2}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE2}\`.* TO '${MYSQL_USER2}'@'%';
FLUSH PRIVILEGES;
EOF
)


# Execute the SQL against MySQL as root (you will be prompted for password)
echo "$SQL" | mysql -u root -p${MYSQL_ROOT_PASSWORD}