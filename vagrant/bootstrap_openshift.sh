#!/bin/sh


echo "Installing OpenShift standalone"
sudo yum update
sudo yum install docker -y
mkdir -p /usr/local/openshift/server
mkdir -p /usr/local/openshift/cli
curl -L  https://github.com/openshift/origin/releases/download/v1.4.0-rc1/openshift-origin-client-tools-v1.4.0-rc1.b4e0954-linux-64bit.tar.gz -o /tmp/openshift-server.tar.gz
curl -L  https://github.com/openshift/origin/releases/download/v1.4.0-rc1/openshift-origin-server-v1.4.0-rc1.b4e0954-linux-64bit.tar.gz -o /tmp/openshift-cli.tar.gz
tar xzvf /tmp/openshift-server.tar.gz -C /usr/local/openshift/server --strip-components=1
tar xzvf /tmp/openshift-cli.tar.gz -C /usr/local/openshift/cli --strip-components=1
export PATH=$PATH:/usr/local/openshift/cli
 #/usr/local/openshift/server
echo "Additional setup for  "
sudo systemctl stop docker
sudo chown vagrant /etc/sysconfig/docker
sudo echo  "INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'" >> /etc/sysconfig/docker
sudo chown root /etc/sysconfig/docker

sudo systemctl start docker

sudo chown vagrant  /var/run/docker.sock

#https://192.168.33.10:8443/
 sudo  /usr/local/openshift/cli/oc cluster up --public-hostname=192.168.33.10 --version=v1.4.0-alpha.1
