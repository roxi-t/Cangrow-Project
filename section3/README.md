# WordPress Multi-Instance Deployment with Docker Compose

## Table of Contents
- [Project Overview](#project-overview)
- [Benefits](#benefits)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
  - [Custom Nginx Configuration](#custom-nginx-configuration)
  - [ProxySQL Configuration](#proxysql-configuration)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)

## Project Overview

This project facilitates the deployment of multiple WordPress instances using Docker Compose, incorporating MariaDB and ProxySQL for enhanced database management and load balancing capabilities.

## Benefits

- **Simplified Management**: Streamlines the setup and operation of multiple WordPress sites.
- **Enhanced Availability**: Utilizes ProxySQL for effective load balancing and high availability.
- **Flexible Customization**: Offers numerous configuration options to tailor to specific needs.

## Prerequisites

Before starting, ensure you have Docker and Docker Compose installed on your machine:
- [Docker Installation Guide](https://docs.docker.com/get-docker/)
- [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)

## Installation

To install and run the project, follow these steps:

1. Clone the repository:
```shell
git clone https://github.com/your-username/wordpress-multi-instance-docker.git
```

3. Create a .env file in the project root directory and add your environment variables 

4. Modify docker-compose.yml for any desired customization (optional).

5. Start the services:
```shell
docker-compose up -d
```
6. and  running this command
```shell
docker ps
```
And you can see that 6 containers have been built and 3 phases of the project are working properly so far.
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
