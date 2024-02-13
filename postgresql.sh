sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -y

sudo apt-get install -qy libpq-dev

install_postgresql() {
  version=$1
  sudo apt-get install --no-install-recommends -qy postgresql-$version
  sudo --login --user postgres psql --command "CREATE ROLE $USER SUPERUSER; ALTER ROLE $USER LOGIN;"
  sudo systemctl stop postgresql@$version-main
  sudo systemctl disable postgresql@$version-main
  echo 'host all all 127.0.0.1/32 trust' | sudo tee -a /etc/postgresql/$version/main/pg_hba.conf
}

install_postgresql 12
install_postgresql 13
install_postgresql 14
install_postgresql 15
install_postgresql 16