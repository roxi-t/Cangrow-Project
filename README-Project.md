CanGrow-Final-project
section1 

A brief description of what this project does and who it's for

Introduction

Cangrow-Project is a web application consisting of two main services: Nginx and WordPress. This project utilizes Docker Compose for managing and running containers and employs Nginx as a web server to create a load-balanced deployment for two instances of WordPress.

Project Structure

The project consists of two main files:

docker-compose.yml: This file contains Docker Compose configurations that define the setup for running Nginx, WordPress1, WordPress2, and MariaDB containers.

nginx.conf: This file contains Nginx configurations serving as the web server for the project. These configurations include proxying to two instances of WordPress provided by WordPress1 and WordPress2 services.

File Descriptions

1. docker-compose.yml
services: This section includes various definitions for each service in the project, including Nginx, WordPress1, WordPress2, and MariaDB.
volumes: Defines repository volumes for storing persistent WordPress and MariaDB database data.
networks: Defines networks used for communication between containers.

3. nginx.conf
upstream wordpress_cluster: Defines a group of WordPress servers as a load-balancing proxy.
server: Defines a server as a host for proxying to WordPress services.
location /: Sets up the proxy path for web requests to WordPress services.
Installation and Execution
To run the project, ensure that Docker and Docker Compose are installed on your system. Then, by using the following commands, configure the Docker Compose and Nginx files and run the project:

Copy code

"docker-compose up -d"
Running this command will execute all project services on containers, and the project will be ready for use.

Conclusion

By executing these Docker Compose and Nginx files, the environment of the Cangrow-Project is prepared, and you can utilize it to create a load-balanced web deployment using WordPress.

These project documents provide explanations about the project structure, the files used, and how to install and execute it.
