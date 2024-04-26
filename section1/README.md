# README for CanGrow-Final-Project

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [File Descriptions](#file-descriptions)
  - [docker-compose.yml](#docker-composeyml)
  - [nginx.conf](#nginxconf)
- [Installation and Execution](#installation-and-execution)
- [Conclusion](#conclusion)

## Introduction

The CanGrow-Final-Project is a sophisticated web application designed to streamline container management and execution using Docker Compose. It leverages Nginx as a robust web server to facilitate load balancing across two WordPress instances, enhancing reliability and performance.

## Project Structure

The project comprises two critical files essential for its operation:

- `docker-compose.yml`: Manages the orchestration of Nginx, two WordPress instances, and a MariaDB container.
- `nginx.conf`: Configures Nginx to serve as a load balancer and proxy to the WordPress instances.

## File Descriptions

### docker-compose.yml

This configuration file sets up the following:

- **services**: Specifies and configures the four main services used in the project:
  - Nginx
  - WordPress1
  - WordPress2
  - MariaDB
- **volumes**: Establishes persistent storage for both WordPress instances and MariaDB, ensuring data durability across container restarts.
- **networks**: Defines private networks for secure and efficient inter-container communication.

### nginx.conf

This configuration file includes settings for:

- **upstream wordpress_cluster**: Manages a load-balancing pool for the WordPress servers, distributing traffic to enhance site responsiveness and uptime.
- **server**: Configures the Nginx server to proxy requests to the WordPress services, handling incoming traffic effectively.

## Installation and Execution

To deploy and run the project, follow these steps:

1. Ensure that Docker and Docker Compose are installed on your system.
2. Clone the repository to your local machine.
3. Navigate to the project directory.
4. Execute the following command to start the services in detached mode:
   ```shell
docker-compose up -d

## Conclusion

This project provides a load-balanced WordPress deployment using Docker Compose and Nginx. The documentation includes explanations of the project structure, files, and installation/execution instructions.
