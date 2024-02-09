export DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

sudo apt-get update -y
sudo apt-get remove needrestart -y

sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq \
  advancecomp \
  autoconf \
  bison \
  build-essential \
  ccache \
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
  optipng \
  pkg-config \
  pngcrush \
  pngquant \
  protobuf-compiler \
  shellcheck \
  shfmt \
  zlib1g-dev
