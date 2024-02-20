# N.B. must be installed *before* ruby

# See here for openssl 1.1 installation
# https://entrision.com/blog/ruby-compile-in-modern-linux-distros

cd /tmp

wget https://www.openssl.org/source/old/1.1.1/openssl-1.1.1w.tar.gz
tar xf openssl-1.1.1w.tar.gz

cd openssl-1.1.1w
./config --prefix=/opt/openssl-1.1.1w --openssldir=/opt/openssl-1.1.1w shared zlib
make && sudo make install
sudo rm -rf /opt/openssl-1.1.1w/certs
sudo ln -s /etc/ssl/certs /opt/openssl-1.1.1w

cd
rm -Rf /tmp/openssl-1.1.1w*