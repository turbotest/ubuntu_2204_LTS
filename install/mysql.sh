# N.B. must NOT be installed at the same time as MariaDB

sudo apt-get install -yq \
  libmysqlclient-dev \
  mysql-client-8.0 \
  mysql-client-core-8.0 \
  mysql-server-8.0

echo 'skip-grant-tables' | sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl disable --now mysql