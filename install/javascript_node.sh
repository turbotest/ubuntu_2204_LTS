# N.B. must be installed *before* headless_browsers

# https://github.com/nvm-sh/nvm

curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

install_node() {
  nvm install $1
  npm install --global npm@10.4.0
  npm install --global yarn
}

install_node 18
install_node 20
install_node 21

nvm alias default 21