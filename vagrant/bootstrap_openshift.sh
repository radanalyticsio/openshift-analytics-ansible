#!/bin/sh


echo "1: Installing OpenShift standalone"
#sudo yum update
sudo yum install docker unzip -y
#mkdir -p /usr/local/openshift/server
mkdir -p /usr/local/openshift/cli
#curl -L  https://github.com/openshift/origin/releases/download/v1.4.0-rc1/openshift-origin-client-tools-v1.4.0-rc1.b4e0954-linux-64bit.tar.gz -o /tmp/openshift-server.tar.gz
curl -L https://github.com/zmhassan/oshinko-console/files/720162/oshinko.zip -o /tmp/oshinko-console.zip
curl -L  https://github.com/openshift/origin/releases/download/v1.4.0-rc1/openshift-origin-server-v1.4.0-rc1.b4e0954-linux-64bit.tar.gz -o /tmp/openshift-cli.tar.gz
#tar xzvf /tmp/openshift-server.tar.gz -C /usr/local/openshift/server --strip-components=1
tar xzvf /tmp/openshift-cli.tar.gz -C /usr/local/openshift/cli --strip-components=1
export PATH=$PATH:/usr/local/openshift/cli
 #/usr/local/openshift/server
echo "2: Docker registry setup"

sudo systemctl stop docker
sudo chown vagrant /etc/sysconfig/docker
sudo echo  "INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'" >> /etc/sysconfig/docker
sudo chown root /etc/sysconfig/docker

sudo systemctl start docker

#dsudo chown vagrant  /var/run/docker.sock

echo "3: Setup oshinko home folder"
mkdir -p /home/oshinko
#https://192.168.33.10:8443/
oc cluster up --host-config-dir=/home/oshinko --public-hostname=192.168.33.10 --version=v1.4.0-alpha.1
echo "4: Taking down cluster"
oc cluster down

echo "5: Copy files to app folder "
sudo unzip /tmp/oshinko-console.zip -d /home/oshinko/master/

# Change Yaml master-config next
sudo cp /vagrant/master-config.yaml /tmp/master-config.yaml
sudo mv  /tmp/master-config.yaml  /home/oshinko/master/master-config.yaml
oc cluster up --host-config-dir=/home/oshinko --public-hostname=192.168.33.10 --version=v1.4.0-alpha.1  --use-existing-config=true
#sudo  /usr/local/openshift/cli/oc login -u system:admin
#sudo  /usr/local/openshift/cli/oc adm policy add-cluster-role-to-user cluster-admin developer
echo "DONE !!"
