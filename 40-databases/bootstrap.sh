# #!/bin/bash

# sudo component=$1
# sudo environment=$2
# sudo dnf install ansible -y
# sudo mkdir -p /var/log/roboshop/ansible
# sudo chown -R ec2-user:ec2-user /var/log/roboshop
# sudo chmod -R 755 /var/log/roboshop
# sudo touch /var/log/roboshop/ansible.log

# sudo cd /home/ec2-user
# sudo git clone https://github.com/Murutiswiggy/robo-ansible-v3.git
# sudo cd roboshop-ansible-v3
# sudo ansible-playbook -e component=$component -e environment=$environment roboshop.yaml

# #!/bin/bash

# component=$1 #mongodb
# environment=$2 #dev
# dnf install ansible -y
# mkdir -p /var/log/roboshop/
# chown -R ec2-user:ec2-user /var/log/roboshop
# chmod -R 755 /var/log/roboshop
# touch /var/log/roboshop/ansible.log

# cd /home/ec2-user
# git clone https://github.com/Murutiswiggy/robo-ansible-v3.git
# cd robo-ansible-v3
# git pull
# ansible-playbook -e component=$component -e environment=$environment roboshop.yaml


# #!/bin/bash
# set -euxo pipefail

# component=$1
# environment=$2

# # Wait for internet connectivity
# until curl -Is https://github.com >/dev/null 2>&1; do
#     echo "Waiting for internet..."
#     sleep 10
# done

# sudo dnf install -y git ansible-core

# cd /home/ec2-user
# rm -rf robo-ansible-v3
# git clone https://github.com/Murutiswiggy/robo-ansible-v3.git

# cd robo-ansible-v3
# ansible-playbook -e component=$component -e environment=$environment roboshop.yaml

#!/bin/bash
set -euxo pipefail

component=$1
environment=$2

dnf install -y git ansible-core

mkdir -p /var/log/roboshop
touch /var/log/roboshop/ansible.log

cd /home/ec2-user

rm -rf robo-ansible-v3
git clone https://github.com/Murutiswiggy/robo-ansible-v3.git

cd robo-ansible-v3

ansible-playbook \
  -i localhost, \
  -c local \
  -e component="$component" \
  -e environment="$environment" \
  roboshop.yaml