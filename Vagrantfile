Vagrant.configure("2") do |config|
    config.vm.define "ansible" do |ansible|
      ansible.vm.box = "bento/ubuntu-20.04"
      ansible.vm.hostname = "ansible.org"
      ansible.vm.network "private_network", ip: "172.192.1.13"
      ansible.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 2
      end
      ansible.vm.provision "shell", path: "scripts/install_ansible.sh"
    end
end