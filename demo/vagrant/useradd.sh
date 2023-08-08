# Add custom user demo_bamboo
groupadd demo_bamboo
useradd demo_bamboo -m -g demo_bamboo -s /bin/bash -d /home/demo_bamboo/
mkdir /home/demo_bamboo/.ssh 
cp /vagrant/id_rsa.pub /home/demo_bamboo/.ssh/authorized_keys
chmod -R 700 /home/demo_bamboo/.ssh
chmod -R 600 /home/demo_bamboo/.ssh/authorized_keys 
chown -R demo_bamboo:demo_bamboo /home/demo_bamboo/
echo "demo_bamboo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/demo_bamboo
chmod 0644 /etc/sudoers.d/demo_bamboo   