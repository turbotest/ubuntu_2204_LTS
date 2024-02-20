# Install Ruby versions
cd /tmp
wget https://raw.githubusercontent.com/postmodern/postmodern.github.io/main/postmodern.asc
gpg --batch --import postmodern.asc

wget https://github.com/postmodern/ruby-install/releases/download/v0.9.3/ruby-install-0.9.3.tar.gz.asc
wget https://github.com/postmodern/ruby-install/releases/download/v0.9.3/ruby-install-0.9.3.tar.gz
gpg --batch --verify ruby-install-0.9.3.tar.gz.asc ruby-install-0.9.3.tar.gz

tar -xzvf ruby-install-0.9.3.tar.gz
cd ruby-install-0.9.3/
make && sudo make install
cd
rm -Rf /tmp/ruby-install-0.9.3*

ruby-install --update

ruby-install 2.7.8 -- --with-openssl-dir=/opt/openssl-1.1.1w --disable-install-doc
ruby-install 3.0.6 -- --with-openssl-dir=/opt/openssl-1.1.1w --disable-install-doc
ruby-install 3.1.4
ruby-install 3.2.3
ruby-install 3.3.0

# Install chruby Ruby version manager
cd /tmp
wget https://github.com/postmodern/chruby/releases/download/v0.3.9/chruby-0.3.9.tar.gz.asc
wget https://github.com/postmodern/chruby/releases/download/v0.3.9/chruby-0.3.9.tar.gz
gpg --batch --verify chruby-0.3.9.tar.gz.asc chruby-0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd
rm -Rf /tmp/chruby-0.3.9*
