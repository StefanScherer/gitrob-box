# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", path: "scripts/install-gitrob.sh"
  config.vm.network "forwarded_port", guest: 9393, host: 9393
  config.vm.post_up_message = "Welcome to the gitrob virtual environment.
  Use the command 'vagrant ssh' to access this box.
  Then enter your GitHub tokens in '~/.gitrobrc'.
  Then use the command 'gitrob -o yourorg -b 0.0.0.0' to check your org.
  Then open the URL http://127.0.0.1:9393 from your host machine."
end
