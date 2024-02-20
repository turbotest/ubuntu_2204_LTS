source ~/.bashrc

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

export LD_LIBRARY_PATH=/opt/openssl-1.1.1w/lib

export PATH=$PATH:/opt/chrome:/opt/chromedriver:/opt/firefox
PATH=$(echo $(sed 's/:/\n/g' <<< $PATH | sort | uniq) | sed -e 's/\s/':'/g')
