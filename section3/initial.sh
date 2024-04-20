#!/bin/bash

# Install ProxySQL
apt-get update
apt-get install -y proxysql

# Configure ProxySQL
cat << EOF > /etc/proxysql.cnf
# ProxySQL Configuration File

admin_variables=
{
  admin_credentials = 'admin:admin'
  mysql_ifaces = '0.0.0.0:6032'
}

mysql_variables=
{
  threads = 4
  max_connections = 2048
  default_query_delay = 0
  default_query_timeout = 36000000
  have_compress = true
  poll_timeout = 2000
  interfaces = '0.0.0.0:6033;/tmp/proxysql.sock'
  default_schema = 'information_schema'
}

mysql_servers =
(
  { address = "mariadb-master", port = 3306, hostgroup = 10 },
  { address = "mariadb-replica", port = 3306, hostgroup = 20 }
)

mysql_users =
(
  { username = "user", password = "password", default_hostgroup = 10, max_connections = 100 },
  { username = "replica", password = "replicapassword", default_hostgroup = 20, max_connections = 100 }
)

mysql_query_rules =
(
  { rule_id = 1, active = 1, match_digest = "^SELECT.*", destination_hostgroup = 20 },
  { rule_id = 2, active = 1, match_digest = "^INSERT.*|^UPDATE.*|^DELETE.*", destination_hostgroup = 10 }
)

mysql_monitor_users =
(
  { username = "monitor", password = "monitorpassword", default_hostgroup = 10, max_connections = 1 }
)

EOF

# Start ProxySQL service
service proxysql start
