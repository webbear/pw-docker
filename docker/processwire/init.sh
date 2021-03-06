#!/bin/bash

chown -R www-data:www-data /var/www/html

mkdir -p /usr/local/etc/php/conf.d

# Enable PHP Extensions
# Change Settings if Needed
cat > /usr/local/etc/php/conf.d/local.ini << EOF

date.timezone="Europe/Zurich"
upload_max_filesize = 1024M
post_max_size = 0
max_file_uploads = 500

extension=gd.so
extension=intl.so
extension=mysqli.so
extension=opcache.so
extension=pdo.so
extension=pdo_mysql.so
extension=pdo_pgsql.so
extension=zip.so
EOF

# Ensure we create the container with UTF-8 locale
cat > /root/.bashrc << EOF
export LANGUAGE=de_CH.UTF-8
export LC_ALL=de_CH.UTF-8
export LANG=de_CH.UTF-8
export LC_TYPE=de_CH.UTF-8
EOF

# Start Apache
source /etc/apache2/envvars
exec apache2ctl -D FOREGROUND
