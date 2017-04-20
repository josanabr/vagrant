# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "openmpi" do |openmpi|
  	openmpi.vm.box = "ubuntu/trusty64"
	openmpi.vm.provision "shell", path: "script.sh"
  	openmpi.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '512' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
		vb.customize [ 'modifyvm', :id, '--name', 'openmpi' ]
  	end
  end
end
