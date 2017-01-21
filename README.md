Oshinko Console Ansible Playbook
=========

Playbook will install oshinko console extension to server


## ScreenShots

On the left sidebar you will see a menu option for spark and you can create a cluster:
![alt tag](https://raw.githubusercontent.com/zmhassan/oshinko-spark-ansible/master/images/Oshinko-Ansible-1.png)

On the overview page you should see your cluster created and running.
![alt tag](https://raw.githubusercontent.com/zmhassan/oshinko-spark-ansible/master/images/Oshinko-Ansible-2.png)

Requirements
------------

Must already have https://github.com/openshift/openshift-ansible already
installed on servers. Then you would run this playbook

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

Apache v2
