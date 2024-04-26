# WordPress Multi-Instance Deployment with Docker Compose

## Project Overview

This project provides a Docker Compose configuration for deploying multiple instances of WordPress alongside MariaDB and ProxySQL for database management and load balancing.

## Benefits

- Simplified setup and management of multiple WordPress instances
- Database load balancing and high availability using ProxySQL
- Customization through flexible configuration options

## Prerequisites

- Docker:  https://docs.docker.com/get-docker/
- Docker Compose: https://docs.docker.com/compose/install/

## Installation

1. Clone this repository:
```shell
   git clone https://github.com/your-username/wordpress-multi-instance-docker.git
```

3. Create a .env file in the project root directory and add your environment variables 

4. Modify docker-compose.yml for any desired customization (optional).

5. Start the services:
```shell
 docker-compose up -d
```
## Configuration

### Environment Variables

Set the following environment variables in env.:
```shell
- WORDPRESS_DB_USER (default: root)
- WORDPRESS_DB_PASSWORD (default: password)
- WORDPRESS_DB_NAME (default: wordpress)
- WORDPRESS_TABLE_PREFIX (default: wp_)
- PROXYSQL_ADMIN_USER (default: proxysql_admin)
- PROXYSQL_ADMIN_PASSWORD (default: password)
- NGINX_HOST (default: localhost)
```
### Custom Nginx Configuration

Customize Nginx settings in nginx.conf. It's mounted into the Nginx container.

### ProxySQL Configuration

Customize ProxySQL settings in proxysql.cnf. It's mounted into the ProxySQL container.

## Usage

Access WordPress instances via http://localhost (or your server IP) with the following URLs:

ProxySQL handles database load balancing and failover.

## Troubleshooting

- Check Docker logs for errors (docker-compose logs).
- Verify environment variables are set correctly.
- If WordPress is not accessible, check the Nginx configuration.
- If ProxySQL is not working, check the ProxySQL configuration or logs.
