[galaxy role]
ansible-galaxy role init common   # create role locally and register in galaxy
ansible-galaxy search apache2
ansible-galaxy info cesnet.apache2
ansible-galaxy install cesnet.apache2 --roles-path ./
ansible-galaxy install cesnet.apache2 -p ./
ansible-galaxy remove cesnet.apache2 
ansible-galaxy list --roles-path ./

[role]


[playbook]
ansible-playbook -i inventory.ini magic.yml
ansible-playbook -i dynamic_inventory_aws_ec2.yml playbook.yml
ansible-playbook -i dynamic_inventory_aws_ec2.yml playbook.yml --limit 'env_Production'

[ad-hoc]
ansible -i inventory2.ini -m ping 1.1.1.1 -k
ansible -i inventory2.ini -m command -a 'whoami' 1.1.1.1

[collection]
ansible-galaxy collection install -r requirements.yml
ansible-galaxy collection install -r ansible/requirements.yml -p ansible/collections
ansible-galaxy collection install ansible.windows,community.windows
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install community.general

ansible-galaxy collection download ansible.windows --download-path ./offline_collections

ansible-galaxy collection verify amazon.aws

ansible-galaxy collection list

ansible-galaxy collection install -U $(ansible-galaxy collection list --format json | jq -r '.[] | keys []') # upgrade all collection

[inventory]
ansible-inventory -i ./ansible_plugins/ap-southeast-2_aws_ec2.yml --graph
ansible-inventory -i inventory.ini --list # static file

ansible -i x.ini -m command -a 'uname -r' HOST_ALIAS
ansible -i x.ini -m command -a 'uname -r' GROUP_NAME

[config]
ansible-config dump | grep coll # current settings
ansible-config init --disabled > ansible.cfg
ansible-config init --disabled -t all > ansible.cfg
ansible-config list # list all configurations
ansible-config view # shows the current config file

[others]
ansible-playbook -l "_brad" site.yml --check    #dry run
ansible --version
gather_facts: no


[Ansible Core \ built-in modules]
ansible.builtin

[namespace]
ns->coll->sub coll->plugin / modules

[plugins]
ansible-doc -t become -l   #list all become plugins

[facts]
ansible_facts[""]
ansible -i inventory -m setup all
debug
ansible -m setup <hostname>  # collect facts about a host
ansible -m setup <hostname> -a "filter=<fact_name>"

[variables]
Playbook variables 
Task variables 
Host variables 
Group variables
Inventory variables
Fact variables
Role variables
Extra variables
Magic variables
Environment variables
Connection variables
Registering variables

[magic variables]
https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html#magic-variables