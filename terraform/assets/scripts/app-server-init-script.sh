#!/bin/bash

echo "sysops ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/sysops
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install mc

# sudo apt -y remove httpd
# sudo apt -y install mc
# sudo apt -y remove httpd-tools
# sudo apt install -y apache2 php mysql-server php8.1-mysql
# service httpd start
# chkconfig httpd on

# usermod -a -G www-data ubuntu
# chown -R ubuntu:www-data /var/www
# chmod 2775 /var/www
# find /var/www -type d -exec chmod 2775 {} \;
# find /var/www -type f -exec chmod 0664 {} \;
# cd /var/www/html
# curl http://169.254.169.254/latest/meta-data/instance-id -o index.html
# curl https://raw.githubusercontent.com/hashicorp/learn-terramino/master/index.php -O