# Puppeteer browser version manager:
# https://developer.chrome.com/blog/chrome-for-testing
# https://googlechromelabs.github.io/chrome-for-testing/

# Automatically download latest chrome and chromedriver version:
# https://github.com/GoogleChromeLabs/chrome-for-testing?tab=readme-ov-file#json-api-endpoints

sudo apt-get install \
  jq \
  libegl1 \
  libgtk-3-0 \
  libgtk-3-0 \
  packagekit-gtk3-module \
  xdg-utils \
  xvfb \
  --no-install-recommends -qy

\. ~/.nvm/nvm.sh
nvm use 21

json_url="https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json"
chrome_version=$(curl -s "$json_url" | jq -r '.channels.Stable.version')

if [ -z "$chrome_version" ]; then
  echo "Failed to extract the Chrome version."
  exit 1
fi

cd
npx --yes @puppeteer/browsers install chrome@"$chrome_version"
npx --yes @puppeteer/browsers install chromedriver@"$chrome_version"

sudo mv ~/chrome/linux-"$chrome_version"/chrome-linux64 /opt/chrome
sudo mv ~/chromedriver/linux-"$chrome_version"/chromedriver-linux64 /opt/chromedriver
rm -Rf ~/chrome ~/chromedriver

npx --yes @puppeteer/browsers install firefox
sudo mv ~/firefox/linux-*/firefox /opt/firefox
rm -Rf ~/firefox
