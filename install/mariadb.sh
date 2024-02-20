# MariaDB & MySQL cannot peacefully co-exist :(
# Install MySQL in base image and add MariaDB installation instructions to
# turbo-test.com documentation:

# See:
# https://mariadb.com/kb/en/installing-mariadb-deb-files
# https://mariadb.com/kb/en/gpg

# sudo curl --silent -LsSo /etc/apt/trusted.gpg.d/mariadb-keyring-2019.gpg https://supplychain.mariadb.com/mariadb-keyring-2019.gpg
# sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/11.2/ubuntu jammy main' -y
# sudo apt-get update -y

# sudo apt-get install --no-install-recommends -qy \
#   libmariadb3 \
#   mariadb-client \
#   mariadb-common \
#   mariadb-server
#
# echo 'skip-grant-tables' | sudo tee -a /etc/mysql/mariadb.conf.d/50-server.cnf
#
# sudo systemctl disable --now mariadb.service

# 10.11 installation
#
# sudo apt-get remove -y \
#   libmariadb3 \
#   mariadb-client \
#   mariadb-common \
#   mariadb-server
#
# sudo sudo add-apt-repository --remove 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/11.2/ubuntu jammy main' -y
# sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.11/ubuntu jammy main' -y
#
# sudo apt-get update -y
#
# sudo apt-get install --no-install-recommends -qy \
#   libmariadb3 \
#   mariadb-client \
#   mariadb-common \
#   mariadb-server
#
# echo 'skip-grant-tables' | sudo tee -a /etc/mysql/mariadb.conf.d/50-server.cnf
#
# sudo systemctl disable --now mariadb.service