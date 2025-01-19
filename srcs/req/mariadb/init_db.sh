#! /bin/bash

# Start mysql
mysqld_safe &

sleep 10;

# Root conf
# Create the user if it doesn't exist
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# Grant all privileges to the root user
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
# Refresh all so that MySQL takes it into account
mysql -e "FLUSH PRIVILEGES;"


# Create a DB if does not exist. Named after the variable MYSQL_DATABASE in .env file
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# Give rights to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# Refresh all so that MySQL takes it into account
mysql -e "FLUSH PRIVILEGES;"

# Keep the MySQL process running in the foreground
wait