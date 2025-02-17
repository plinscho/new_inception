#!/bin/bash

sleep 10;

if [ -f ./wp-config.php ]; then
    echo "The config file is already created."
else
    wp core download --allow-root

    wp config create --dbname=$db1_name \
                        --dbuser=$db_user \
                        --dbpass=$db_pwd \
                        --dbhost='mariadb' --allow-root

    wp core install --url=$DOMAIN_NAME \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PWD \
                    --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

    wp user create $WP_USER $WP_EMAIL --role=author \
                    --user_pass=$WP_PWD --allow-root

    wp theme install twentytwentyfour --activate --allow-root

fi

/usr/sbin/php-fpm7.4 -F;