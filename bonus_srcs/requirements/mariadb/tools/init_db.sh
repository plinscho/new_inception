#! /bin/bash

# Start MariaDB server
mysqld_safe --skip-networking &

# Wait for the server to start
sleep 10

echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'wordpress.inception' IDENTIFIED BY '$db1_pwd' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
mysql < db1.sql


echo "Created database: $db1_name. User created with name: $db1_user and password $db1_pwd."
# Stop the MariaDB root server
mysqladmin -u root -p1234 shutdown

# Start MariaDB server in the foreground
exec mysqld