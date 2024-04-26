Roxana-Teymoori
CanGrow-Project

This repository hosts the configuration files for a scalable WordPress deployment using Docker. It includes docker-compose.yml for orchestrating multiple containers and nginx.conf for setting up Nginx as a reverse proxy. The setup features a MariaDB replication with a master-replica architecture to enhance data availability and load balancing. Additionally, ProxySQL is configured to manage database traffic, routing write queries to the master and read queries to the replica. This project aims to provide a robust, scalable environment for running WordPress with optimal performance and reliabil
