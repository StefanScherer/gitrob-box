#!/bin/bash

apt-get update
apt-get install -y postgresql
apt-get install -y postgresql-server-dev-9.3

sudo -u postgres createuser -s gitrob -w
gitrobpw="gitrobpw"
sudo -u postgres psql -c "ALTER USER gitrob WITH PASSWORD '$gitrobpw';"
sudo -u postgres createdb -O gitrob gitrob

apt-get install -y build-essential
apt-get install -y ruby1.9.1-dev

gem install bundler --no-rdoc --no-ri
gem install gitrob --no-rdoc --no-ri

chmod 644 /var/lib/gems/1.9.1/gems/gitrob-0.0.3/public/javascripts/*.js

# agreement
gitrobversion=`gem list | grep gitrob | awk -vRS=")" -vFS="(" '{print $2}'`
echo "user accepted" >/var/lib/gems/1.9.1/gems/gitrob-$gitrobversion/agreement

cat <<EOF > .gitrobrc
---
sql_connection_uri: postgres://gitrob:gitrobpw@localhost:5432/gitrob
github_access_tokens:
- XXXENTERYOURGITHUBTOKENHEREXXX
EOF
chown vagrant:vagrant .gitrobrc

if [ -f /vagrant/patterns.json ]; then
  echo "Installing own version of patterns.json ..."
  cp /var/lib/gems/1.9.1/gems/gitrob-$gitrobversion/patterns.json /var/lib/gems/1.9.1/gems/gitrob-$gitrobversion/patterns.json.orig
  cp /vagrant/patterns.json /var/lib/gems/1.9.1/gems/gitrob-$gitrobversion/patterns.json
fi
