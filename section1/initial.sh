#!/bin/bash

# Create necessary directories
mkdir -p nginx wordpress1 wordpress2 mariadb

# Create nginx configuration file
cat << EOF > nginx/nginx.conf
# Your nginx configuration here
EOF

# Create Docker Compose file
cat << EOF > docker-compose.yml
version: '3.8'

services:
  nginx:
    image: nginx:latest
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf  # Mounting custom Nginx configuration file
    ports:
      - "80:80"                            # Mapping port 80 of the host to port 80 of the container
    networks:
      - cangrownet

  wordpress1:
    image: wordpress:latest
    environment:
      - WORDPRESS_DB_HOST=mariadb
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=wordpress
      - WORDPRESS_DB_NAME=wordpress
    volumes:
      - wordpress_data:/var/www/html        # Mounting volume for persistent WordPress data
    networks:
      - cangrownet

  wordpress2:
    image: wordpress:latest
    environment:
      - WORDPRESS_DB_HOST=mariadb
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=wordpress
      - WORDPRESS_DB_NAME=wordpress
    volumes:
      - wordpress_data:/var/www/html         # Mounting volume for persistent WordPress data
    networks:
      - cangrownet

  mariadb:
    image: mariadb:latest
    environment:
      - MYSQL_ROOT_PASSWORD=wordpress
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - MYSQL_PASSWORD=wordpress
    volumes:
      - db_data:/var/lib/mysql            # Mounting volume for persistent MariaDB data
    networks:
      - cangrownet

volumes:
  wordpress_data:                        # Persistent volume for WordPress data
  db_data:                               # Persistent volume for MariaDB data

networks:
  cangrownet:
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 172.28.0.0/28         # Configuring custom subnet for the network
EOF
