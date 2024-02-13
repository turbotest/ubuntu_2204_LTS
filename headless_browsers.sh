# Chrome
sudo wget -qO /etc/apt/trusted.gpg.d/google_linux_signing_key.asc https://dl.google.com/linux/linux_signing_key.pub
echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt-get update -qy
sudo apt-get install --no-install-recommends -qy google-chrome-stable

# Firefox
sudo snap remove firefox
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

sudo apt-get update -y
sudo apt-get install firefox --no-install-recommends -yq