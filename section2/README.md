## README for Cangrow-Project

## Introduction

This project provides a Docker Compose configuration for setting up a WordPress website with a MariaDB database master-replica setup using Docker containers.

Prerequisites

• Docker
• Docker Compose

## Usage

1. Clone the repository:
```shell
    git clone https://github.com/roxi-t/Cangrow-Project.git
   ```
2. Navigate to the project directory:
 ```shell
  cd Cangrow-Project
```
3. Run Docker Compose:
```shell
 docker-compose up -d
```
4. Access WordPress at: http://localhost or your server IP

## Services

• nginx: Reverse proxy for WordPress.
• wordpress1: WordPress instance 1.
• wordpress2: WordPress instance 2.
• mariadb-master: MariaDB master database server.
• mariadb-replica: MariaDB replica database server.

## Configuration

• docker-compose.yml: Defines configurations for all services, including:
    * Nginx: Reverse proxy settings and port mapping.
    * WordPress: Persistent data storage and database connection settings.
    * MariaDB: Database configuration and replication options.
• nginx.conf: Nginx web server configuration.

## Networking

• Custom bridge network named cangrownet with subnet /28

## Volumes

• wordpress_data: Persistent storage for WordPress data.
• master-data: Persistent storage for MariaDB master data.
• replica-data: Persistent storage for MariaDB replica data.

## Additional Information

Refer to the comments in the docker-compose.yml file for more details.
