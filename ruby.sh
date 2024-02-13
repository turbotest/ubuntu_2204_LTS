# https://www.ruby-lang.org/en/downloads/releases/
# https://rvm.io/binaries/ubuntu/22.04/x86_64/

\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
source ~/.bash_profile

# See here if openssl 1.0.1 doesn't work:
# https://entrision.com/blog/ruby-compile-in-modern-linux-distros
rvm pkg install openssl
rvm install ruby-2.7 --binary --with-openssl-dir=$HOME/.rvm/usr

rvm install ruby-3.0.6 --binary --with-openssl-dir=$HOME/.rvm/usr
gem update --system --no-doc

rvm install ruby-3.1.4 --binary
gem update --system --no-doc

rvm install ruby-3.2
gem update --system --no-doc

rvm install ruby-3.3
gem update --system --no-doc