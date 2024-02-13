sudo DEBIAN_FRONTEND=noninteractive sudo apt-get install --no-install-recommends -yq \
  mysql-server-8.0

sudo mysql -u root -e "CREATE USER IF NOT EXISTS '$USER'@'%';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$USER'@'%';"

sudo systemctl stop mysql.service
sudo systemctl disable mysql.service