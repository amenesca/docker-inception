#!/bin/sh
cd /var/www/
if [ ! -f "/var/www/wp-config.php" ]; then
  wp cli update
  /usr/local/bin/wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" --dbhost="${DB_HOST}" --force
  /usr/local/bin/wp config set FS_METHOD 'direct'
  /usr/local/bin/wp config set WP_REDIS_HOST 'redis'
  /usr/local/bin/wp config set WP_REDIS_PORT 6379
  /usr/local/bin/wp config set WP_REDIS_TIMEOUT 1
  /usr/local/bin/wp config set WP_REDIS_READ_TIMEOUT 1
  /usr/local/bin/wp config set WP_REDIS_DATABASE 0
  
  /usr/local/bin/wp core install --url="https://amenesca.42.fr" --title="${WP_TITLE}" --admin_user="${ADM_WP_NAME}" --admin_password="${ADM_WP_PASS}" --admin_email="${ADM_WP_EMAIL}"
  /usr/local/bin/wp user create "${WP_USERNAME}" "${WP_USEREMAIL}" --role="editor" --user_pass="${WP_USERPASS}"
fi
