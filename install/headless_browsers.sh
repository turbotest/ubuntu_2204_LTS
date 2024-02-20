# Puppeteer browser version manager:
# https://developer.chrome.com/blog/chrome-for-testing

sudo apt-get install packagekit-gtk3-module --no-install-recommends -qy

# See Chrome for Testing release dashboard for version availability:
# https://googlechromelabs.github.io/chrome-for-testing
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm use 21

cd
npx --yes @puppeteer/browsers install chrome@121.0.6167.85
npx --yes @puppeteer/browsers install chromedriver@121.0.6167.85

sudo mv ~/chrome/linux-121.0.6167.85/chrome-linux64 /opt/chrome
sudo mv ~/chromedriver/linux-121.0.6167.85/chromedriver-linux64 /opt/chromedriver
rm -Rf ~/chrome ~/chromedriver

echo "export PATH=$PATH:/opt/chrome:/opt/chromedriver" >> ~/.bash_profile

# Firefox
npx --yes @puppeteer/browsers install firefox
sudo mv ~/firefox/linux-*/firefox /opt/firefox
rm -Rf ~/firefox

echo "export PATH=$PATH:/opt/firefox" >> ~/.bash_profile