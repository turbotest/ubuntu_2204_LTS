echo '
source ~/.bashrc
[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh
[ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
[ -f /usr/local/share/chruby/auto.sh ] && source /usr/local/share/chruby/auto.sh

export LD_LIBRARY_PATH=/opt/openssl-1.1.1w/lib
export PATH=$PATH:/opt/chrome:/opt/chromedriver:/opt/firefox
' | tee -a ~/.bash_profile
