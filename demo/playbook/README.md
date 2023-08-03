# How to run

ansible-playbook -i inventories/production/hosts site.yml -l etcd -t etcd

ansible-playbook -i inventories/production/hosts site.yml -l bamboofw-agent -t bamboofw-agent