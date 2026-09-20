#!/bin/bash

set -e

apk add mysql mysql-client

mysql_install_db --user=mysql --datadir=/var/lib/mysql

rc-service mariadb start

mysqladmin -u root password toor

mysql_secure_installation
