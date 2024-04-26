#!/bin/bash

# Use environment variables for sensitive information
MYSQL_HOST="mariadb-replica"
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-masterpassword}  # Default if not set
MYSQL_REPLICA_USER="replica"
MYSQL_REPLICA_PASSWORD="replicapassword"
MAX_RETRIES=12

echo "Waiting for MariaDB replica to be ready..."

# Wait for MariaDB replica to be ready with retry logic
retry_count=0
until mysql -h "$MYSQL_HOST" -u root -p"$MYSQL_ROOT_PASSWORD" -e "SHOW DATABASES;" &> /dev/null
do
    if [ $retry_count -eq $MAX_RETRIES ]; then
        echo "Failed to connect to MariaDB replica after $MAX_RETRIES attempts."
        exit 1
    fi
    echo "Retrying to connect to MariaDB replica ($((++retry_count)))..."
    sleep 5
done

echo "MariaDB replica is ready. Configuring replication..."

# Configure replication on the replica
if ! mysql -h "$MYSQL_HOST" -u root -p"$MYSQL_ROOT_PASSWORD" -e "CHANGE MASTER TO MASTER_HOST='mariadb-master', MASTER_USER='$MYSQL_REPLICA_USER', MASTER_PASSWORD='$MYSQL_REPLICA_PASSWORD', MASTER_AUTO_POSITION=1;"
then
    echo "Failed to configure master on MariaDB replica."
    exit 1
fi

if ! mysql -h "$MYSQL_HOST" -u root -p"$MYSQL_ROOT_PASSWORD" -e "START SLAVE;"
then
    echo "Failed to start slave process on MariaDB replica."
    exit 1
fi

echo "Replication configured and started successfully on MariaDB replica."
