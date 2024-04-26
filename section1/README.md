README for CanGrow-Final-Project Section 1

Introduction

CanGrow-Final-Project is a web application that utilizes Docker Compose to manage and run containers. It includes Nginx as a web server for load-balancing two instances of WordPress.

Project Structure

The project has two main files:

• docker-compose.yml: Docker Compose configuration for running Nginx, WordPress1, WordPress2, and MariaDB containers.
• nginx.conf: Nginx configuration for the web server, including proxying to WordPress instances.

File Descriptions

docker-compose.yml

• services: Defines services (Nginx, WordPress1, WordPress2, MariaDB) and their configurations.
• volumes: Persistent storage for WordPress and MariaDB data.
• networks: Networks for container communication.

nginx.conf

• upstream wordpress_cluster: Load-balancing proxy for WordPress servers

• server: Host for proxying to WordPress services.

Installation and Execution

1. Ensure Docker and Docker Compose are installed.
2. Run the following commands:
3. run the project's services.
   ```shell
    docker-compose up -d to 
   ```
4. The project will be ready for use.

Conclusion

This project provides a load-balanced WordPress deployment using Docker Compose and Nginx. The documentation includes explanations of the project structure, files, and installation/execution instructions.
