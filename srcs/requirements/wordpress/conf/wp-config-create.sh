#!bin/sh
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp cli update
wp core download
wp config create --force --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST}
#wp core install --url="h" --title=SEU_TITULO --admin_user=SEU_USUARIO --admin_password=SUA_SENHA --admin_email=SEU_EMAIL

