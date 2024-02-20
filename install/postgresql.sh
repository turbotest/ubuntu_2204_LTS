# https://wiki.postgresql.org/wiki/Apt
curl --silent https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --batch --dearmor | sudo tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg
sudo rm -f /etc/apt/sources.list.d/postgresql.list
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jammy-pgdg main" > /etc/apt/sources.list.d/postgresql.list'
sudo apt-get update -y
sudo apt-get install --no-install-recommends -qy libpq-dev

install_postgresql() {
  version=$1
  sudo apt-get install --no-install-recommends -qy postgresql-$version
  echo 'host all all 127.0.0.1/32 trust' | sudo tee -a /etc/postgresql/$version/main/pg_hba.conf > /dev/null
  sudo sed -i 's/port = 543[0-9]/port = 5432/' /etc/postgresql/$version/main/postgresql.conf
  sudo sed -i 's/auto/manual/' /etc/postgresql/$version/main/start.conf
  sudo systemctl disable --now postgresql@$version-main.service
  sudo systemctl enable --now postgresql@$version-main.service
  sudo --login --user postgres psql --command "CREATE ROLE $USER SUPERUSER; ALTER ROLE $USER LOGIN;"
  sudo systemctl disable --now postgresql@$version-main.service
}

install_postgresql 12
install_postgresql 13
install_postgresql 14
install_postgresql 15
install_postgresql 16
