#!/bin/bash
sed -i "s|.*max_allowed_packet\s*=.*|max_allowed_packet = 100M|g" /etc/mysql/my.cnf
sed -i "s|.*max_allowed_packet\s*=.*|max_allowed_packet = 100M|g" /etc/my.cnf.d/mariadb-server.cnf

sed -i "s|.*bind-address\s*=.*|bind-address=127.0.0.1|g" /etc/mysql/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=127.0.0.1|g" /etc/my.cnf.d/mariadb-server.cnf

cat > /etc/my.cnf.d/mariadb-server-default-charset.cnf << EOF
[client]
default-character-set = utf8mb4

[mysqld]
collation_server = utf8mb4_unicode_ci
character_set_server = utf8mb4

[mysql]
default-character-set = utf8mb4
EOF

rc-service mariadb restart

rc-update add mariadb default
