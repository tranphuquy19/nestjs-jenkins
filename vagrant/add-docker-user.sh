#!/usr/bin/env bash

# help() {
#   cat <<EOF
#   Arguments:
#   +\$1 given username
#   Usage example:
#   $ ./add-docker-user.sh jenkins
# EOF
# }

# # init vars
# USR=$1
# if [[ -z jenkins ]]; then
#   help
#   exit 1
# fi

# generate SSH key pairs
# REF. https://stackoverflow.com/a/43235320/1235074
ssh-keygen -q -N '' -m PEM -t rsa -f "/root/.ssh/id_rsa_jenkins" <<< ""$'\n'"y" 2>&1 >/dev/null

# # create new user
echo "Adding user jenkins"
useradd -m -d /home/jenkins -s /bin/bash jenkins
echo "Add jenkins user to Docker"
usermod -aG docker jenkins
mkdir -p /home/jenkins/.ssh

# Mkdir data folder -> mount into Jenkins container
mkdir -p /home/jenkins/data
chmod -R 777 /home/jenkins/data

touch /home/jenkins/.ssh/authorized_keys
cat "/root/.ssh/id_rsa_jenkins.pub" > /home/jenkins/.ssh/authorized_keys
ssh -i /root/.ssh/id_rsa_jenkins jenkins@localhost "docker --version && echo '>>> DONE. New user (jenkins) added'"