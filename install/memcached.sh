sudo apt-get install --no-install-recommends -qy \
  libmemcached-tools \
  memcached \

sudo systemctl disable --now memcached