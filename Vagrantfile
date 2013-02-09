# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = 'precise32'
  config.ssh.forward_agent = true
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe('apt')
    chef.add_recipe('ruby_200_rc2')
  end
end
