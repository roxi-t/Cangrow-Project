#!/bin/bash

# Path to the ProxySQL configuration file
PROXYSQL_CONFIG_FILE="/etc/proxysql.cnf"

# Check if the ProxySQL configuration file exists
if [ ! -f "$PROXYSQL_CONFIG_FILE" ]; then
    echo "Error: Configuration file does not exist at $PROXYSQL_CONFIG_FILE"
    exit 1
fi

# Function to append configuration to the ProxySQL configuration file
append_config() {
    echo "$1" >> "$PROXYSQL_CONFIG_FILE"
    if [ $? -ne 0 ]; then
        echo "Error appending configuration: $1"
        exit 1
    fi
}

# Configuration lines to be added to the ProxySQL configuration file
config_lines=(
    "mysql_servers_table = ("
    "    { address = \"mariadb-master\", port = 3306, hostgroup = 10 },"
    "    { address = \"mariadb-replica\", port = 3306, hostgroup = 20 }"
    ")"
    "mysql_users_table = ("
    "    { username = \"user\", password = \"password\", default_hostgroup = 10, max_connections = 100 },"
    "    { username = \"replica\", password = \"replicapassword\", default_hostgroup = 20, max_connections = 100 }"
    ")"
    "mysql_query_rules = ("
    "    { rule_id = 1, active = 1, match_digest = \"^SELECT.*\", destination_hostgroup = 20 },"
    "    { rule_id = 2, active = 1, match_digest = \"^INSERT.*|^UPDATE.*|^DELETE.*\", destination_hostgroup = 10 }"
    ")"
    "mysql_monitor_users = ("
    "    { username = \"monitor\", password = \"monitorpassword\", default_hostgroup = 10, max_connections = 1 }"
    ")"
)

# Append each configuration line to the configuration file
for line in "${config_lines[@]}"; do
    append_config "$line"
done

echo "ProxySQL configuration updated successfully."
