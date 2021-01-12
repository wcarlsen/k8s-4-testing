Vagrant.configure("2") do |config|

  K8S_VERSION = "v1.19.3"

  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu"
    vb.memory = "2048"
    vb.cpus = "2"
  end
  config.vm.provision :docker
  config.vm.provision "shell", privileged: false, path: "install-kubectl.sh", env: {"VERSION" => K8S_VERSION}
  #config.vm.provision "shell", privileged: false, path: "install-minikube.sh", env: {"VERSION" => K8S_VERSION}
  #config.vm.provision "shell", privileged: false, path: "install-kind.sh", env: {"VERSION" => K8S_VERSION}
  config.vm.provision "shell", privileged: false, path: "install-k3d-k3s.sh", env: {"VERSION" => K8S_VERSION + "+k3s1"}
end
