#!/bin/bash

# Create necessary directories
mkdir -p masterdb replicadb

# Create initial scripts for master and replica databases
cat << EOF > masterdb/initial.sh
#!/bin/bash

# Wait for MariaDB to start
until mysql -h"\$WORDPRESS_DB_HOST" -u"\$MYSQL_USER" -p"\$MYSQL_PASSWORD" -e "SELECT 1"; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 1
done

>&2 echo "MariaDB is up - executing commands"

# Create database if not exists
mysql -h"\$WORDPRESS_DB_HOST" -u"\$MYSQL_USER" -p"\$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS mydb;"

EOF

cat << EOF > replicadb/initial.sh
#!/bin/bash

# Wait for MariaDB to start
until mysql -h"\$WORDPRESS_DB_HOST" -u"\$MYSQL_USER" -p"\$MYSQL_PASSWORD" -e "SELECT 1"; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 1
done

>&2 echo "MariaDB is up - executing commands"

# Create replication user
mysql -h"\$WORDPRESS_DB_HOST" -u"\$MYSQL_USER" -p"\$MYSQL_PASSWORD" -e "CREATE USER IF NOT EXISTS 'replica'@'%';"
mysql -h"\$WORDPRESS_DB_HOST" -u"\$MYSQL_USER" -p"\$MYSQL_PASSWORD" -e "GRANT REPLICATION SLAVE ON *.* TO 'replica'@'%';"

EOF

# Provide execute permission to the initial scripts
chmod +x masterdb/initial.sh replicadb/initial.sh

# Create Docker Compose file for master and replica databases
cat << EOF > docker-compose.yml
version: '3.8'

services:
  masterdb:
    image: mariadb:latest
    environment:
      - MYSQL_ROOT_PASSWORD=masterpassword
      - MYSQL_DATABASE=mydb
      - MYSQL_USER=user
      - MYSQL_PASSWORD=password
    volumes:
      - master-data:/var/lib/mysql
      - ./masterdb/initial.sh:/docker-entrypoint-initdb.d/initial.sh
    networks:
      - cangrownet

  replicadb:
    image: mariadb:latest
    environment:
      - MYSQL_ROOT_PASSWORD=replicapassword
      - MYSQL_DATABASE=mydb
      - MYSQL_USER=user
      - MYSQL_PASSWORD=password
      - MYSQL_REPLICA_HOST=masterdb
      - MYSQL_REPLICA_USER=replica
      - MYSQL_REPLICA_PASSWORD=replicapassword
      - MYSQL_MASTER_PORT_NUMBER=3306
    command: --replicate-do-db=mydb --server-id=2
    volumes:
      - replica-data:/var/lib/mysql
      - ./replicadb/initial.sh:/docker-entrypoint-initdb.d/initial.sh
    networks:
      - cangrownet

volumes:
  master-data:
  replica-data:

networks:
  cangrownet:
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 172.28.0.0/28
EOF
