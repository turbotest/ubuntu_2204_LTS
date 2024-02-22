#!/bin/bash --login

source ~/.bash_profile
chruby 3.2.3

cd /vagrant
bundle install
rake test