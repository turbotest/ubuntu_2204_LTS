curl --silent -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --batch --dearmor -o /usr/share/keyrings/elastic.gpg

if [ ! -f /etc/apt/sources.list.d/elastic-7.x.list ]; then
  echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
fi

# Add turbo-test.com docs for elasticsearch 8.0:
# https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html
# sudo rm /etc/apt/sources.list.d/elastic-7.x.list
# wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
# sudo apt-get update -y

sudo apt-get update -y
sudo apt-get install elasticsearch -qy
echo 'xpack.security.enabled: false' | sudo tee -a /etc/elasticsearch/elasticsearch.yml
sudo systemctl disable --now elasticsearch