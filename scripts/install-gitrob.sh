#!/bin/bash

apt-get update
apt-get install -y postgresql
apt-get install -y postgresql-server-dev-9.3

sudo -u postgres createuser -s gitrob -w
sudo -u postgres createdb -O gitrob gitrob

apt-get install -y build-essential
apt-get install -y ruby1.9.1-dev
# apt-get install -y ruby1.9.3

gem install bundler --no-rdoc --no-ri
gem install gitrob --no-rdoc --no-ri

