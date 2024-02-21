# Puppeteer browser version manager:
# https://developer.chrome.com/blog/chrome-for-testing

sudo apt-get install \
  libegl1 \
  libgtk-3-0 \
  libgtk-3-0 \
  packagekit-gtk3-module \
  xdg-utils \
  xvfb \
  --no-install-recommends -qy

\. ~/.nvm/nvm.sh
nvm use 21

cd
npx --yes @puppeteer/browsers install chrome@121.0.6167.85
npx --yes @puppeteer/browsers install chromedriver@121.0.6167.85

sudo mv ~/chrome/linux-121.0.6167.85/chrome-linux64 /opt/chrome
sudo mv ~/chromedriver/linux-121.0.6167.85/chromedriver-linux64 /opt/chromedriver
rm -Rf ~/chrome ~/chromedriver

# Firefox - NOT working :(
# npx --yes @puppeteer/browsers install firefox
# sudo mv ~/firefox/linux-*/firefox /opt/firefox
# rm -Rf ~/firefox
