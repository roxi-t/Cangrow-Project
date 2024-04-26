**Roxana-Teymoori  Student of Saadi school** 

## CanGrow-project
## About this Project

This repository hosts the configuration files for a scalable WordPress deployment using Docker. It includes docker-compose.yml for orchestrating multiple containers and nginx.conf for setting up Nginx as a reverse proxy. The setup features a MariaDB replication with a master-replica architecture to enhance data availability and load balancing. Additionally, ProxySQL is configured to manage database traffic, routing write queries to the master and read queries to the replica. This project aims to provide a robust, scalable environment for running WordPress with optimal performance and reliabil

## How to Run 
1. To run this project in the folder /Cangrow-project/section3, follow the steps below:
2. Clone the project from your personal GitHub repository or the main project repository using the following command in your terminal:
```shell
git clone https://github.com/roxi-t/Cangrow-Project.git
```
a directory named Cangrow-Project has been created
3. Go to the project directory :
```shell
cd Cangrow-Project
```
4. Use Docker Compose to start the service in detached mode:
```shell
cd  Cangrow-Project/section3
```
5. And run the project with this command
```shell
docker-compose up -d
````
## At the End 

 You should now be able to access your WordPress website at http://localhost or your server IP address. You will also have access to the database where you have previously stored the desired data.
