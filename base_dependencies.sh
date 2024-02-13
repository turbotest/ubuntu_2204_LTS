export DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

sudo apt-get update -qy
sudo apt-get remove needrestart -qy

sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq \
  advancecomp \
  apt-transport-https \
  autoconf \
  bison \
  build-essential \
  ccache \
  checkinstall \
  clang \
  cmake \
  curl \
  ffmpeg \
  file \
  g++ \
  gcc \
  gifsicle \
  git \
  git-core \
  gnupg \
  gpg \
  imagemagick \
  jhead \
  jpegoptim \
  libcurl4-openssl-dev \
  libffi-dev \
  libgdbm-dev \
  libicu-dev \
  libidn11-dev \
  libjemalloc-dev \
  libjpeg-progs \
  libksba-dev \
  libksba8 \
  libncurses5-dev \
  libpq-dev \
  libprotobuf-dev \
  libreadline-dev \
  libreadline6-dev \
  libsnappy-dev \
  libssl-dev \
  libtool \
  libxml2-dev \
  libxslt1-dev \
  libyaml-dev \
  llvm \
  lsb-release \
  optipng \
  pkg-config \
  pngcrush \
  pngquant \
  protobuf-compiler \
  shellcheck \
  shfmt \
  software-properties-common \
  zlib1g-dev \
