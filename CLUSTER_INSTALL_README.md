Installing OpenShift On Cluster:
================================

It is recommended that you first install openshift using `https://github.com/openshift/openshift-ansible/` then once installed you can go ahead and try this ansible playbook by running

```bash

ansible-playbook -i inventory_cluster.yml site.yml

```

Sample inventory_cluster file:
```bash

[openshift-all-in-one]
192.168.122.212          ansible_connection=ssh  ansible_ssh_user=root  ansible_ssh_private_key_file=~/.ssh/id_rsa

```
Note: 192.168.122.212 is a virtual machine I'm using locally but this can be the openshift master node ip address or hostname
