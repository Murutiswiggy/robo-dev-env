# #!/bin/bash

# component=$1
# environment=$2
# dnf install ansible -y
# mkdir -p /var/log/roboshop/ansible
# chown -R ec2-user:ec2-user /var/log/roboshop
# chmod -R 755 /var/log/roboshop
# touch /var/log/roboshop/ansible.log

# cd /home/ec2-user
# git clone https://github.com/Murutiswiggy/robo-ansible-v3.git
# cd robo-ansible-v3
# ansible-playbook -e component=$component -e environment=$environment roboshop.yaml

# #!/bin/bash

# component=$1
# environment=$2

# dnf install ansible git -y

# mkdir -p /var/log/roboshop
# chmod -R 755 /var/log/roboshop

# cd /home/ec2-user
# rm -rf robo-ansible-v3
# git clone https://github.com/Murutiswiggy/robo-ansible-v3.git

# cd robo-ansible-v3

# ansible-playbook \
#   -e component=$component \
#   -e environment=$environment \
#   roboshop.yaml | tee /var/log/roboshop/ansible.log


#!/bin/bash

component=$1 #mongodb
environment=$2 #dev
dnf install ansible -y
mkdir -p /var/log/roboshop/
chown -R ec2-user:ec2-user /var/log/roboshop
chmod -R 755 /var/log/roboshop
touch /var/log/roboshop/ansible.log

cd /home/ec2-user
git clone https://github.com/Murutiswiggy/robo-ansible-v3.git
cd robo-ansible-v3
git pull
ansible-playbook -e component=$component -e env=$environment roboshop.yaml