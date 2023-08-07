# Add custome user 
groupadd canhdx
useradd canhdx -m -g canhdx -s /bin/bash -d /home/canhdx/
mkdir /home/canhdx/.ssh 
touch /home/canhdx/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb2IlQsrBnbcgTUSVnS3QdjBGYuDWfOFSaFEn1INf66P0dCxumrZla+XlTtVXbDJ+55xZALbUorsjUaBkJFdd3pYg0b2iVZwvX++UUcDyrsn2Hdl7c+6X0P+FBBb6oU3Rc60vuiGwNV8C0apUG6VfY0utDyiShHK+Iv6XHEavAuSCWGkoERnDQdp162VbSirSrep9RRBKFi7tRmqnkhsXM1GPXiHL9LUaC0hejsVH7V5UhZf/wPiLQwYTSSw938+fT36EaF0GjwgkGE5LVU3ii9PpCfQxHj+WE1UuhQuDWExD2+cx9lzXntBxPeQOZT8aImdZoi46jgBqeIic8gkbdGTuKarYL/kgS6aETvB7th66Zbrsg/ScJJIKGA5lgYaoH8tKkZJnNmegQXc24VxzpR5o7oo5RllN7pP79gDR/SupZbz+lpoCmjwNw2injbvz5qy8I5osrL3dnUacGQ6ioX9GmUS+MkmIBopt0UDd0elzNADAMHwt2I8nf+Q5D7Jk= canhdx@PC-CanhDX8' >> /home/canhdx/.ssh/authorized_keys
chmod -R 700 /home/canhdx/.ssh
chmod -R 600 /home/canhdx/.ssh/authorized_keys 
chown -R canhdx:canhdx /home/canhdx/
echo "canhdx ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/canhdx
chmod 0644 /etc/sudoers.d/canhdx