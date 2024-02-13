# See:
# https://mariadb.com/kb/en/installing-mariadb-deb-files
# https://mariadb.com/kb/en/gpg/

sudo curl -LsSo /etc/apt/trusted.gpg.d/mariadb-keyring-2019.gpg https://supplychain.mariadb.com/mariadb-keyring-2019.gpg

sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/11.2/ubuntu jammy main' -y

sudo apt-get update -y

sudo apt-get install -y \
  libmariadb3 \
  mariadb-client \
  mariadb-common \
  mariadb-server

sudo mariadb -u root -e "CREATE USER IF NOT EXISTS '$USER'@'%';"
sudo mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$USER'@'%';"

sudo systemctl stop mariadb.service
sudo systemctl disable mariadb.service

# Add to docs to install 10.11
#
# sudo apt-get remove -y \
#   libmariadb3 \
#   mariadb-client \
#   mariadb-common \
#   mariadb-server
# 
# sudo sudo add-apt-repository --remove 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/11.2/ubuntu jammy main' -y
#
# sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.11/ubuntu jammy main' -y
#
# sudo apt-get update -y
#
# sudo apt-get install -y \
#   libmariadb3 \
#   mariadb-client \
#   mariadb-common \
#   mariadb-server