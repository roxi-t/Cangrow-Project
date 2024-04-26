#!/bin/bash

# Function to log and exit on error
exit_on_error() {
    echo "Error: $1"
    exit 1
}

# Wait for the MariaDB container to be up and running
until docker-compose exec mariadb-master mysqladmin ping -h"mariadb-master" --silent; do
    echo "Waiting for MariaDB container..."
    sleep 5
done

# Run SQL commands to create initial database in MariaDB
docker-compose exec mariadb-master mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" || exit_on_error "Failed to create MariaDB database"

# Wait for the WordPress containers to be up and running
until docker-compose exec wordpress1 curl -s http://wordpress1:80; do
    echo "Waiting for WordPress container 1..."
    sleep 5
done

until docker-compose exec wordpress2 curl -s http://wordpress2:80; do
    echo "Waiting for WordPress container 2..."
    sleep 5
done

# Run WordPress initial setup commands
docker-compose exec wordpress1 wp core install --url="http://wordpress1" --title="WordPress 1" --admin_user="admin" --admin_password="admin" --admin_email="admin@example.com" || exit_on_error "Failed to install WordPress on wordpress1"

docker-compose exec wordpress2 wp core install --url="http://wordpress2" --title="WordPress 2" --admin_user="admin" --admin_password="admin" --admin_email="admin@example.com" || exit_on_error "Failed to install WordPress on wordpress2"
