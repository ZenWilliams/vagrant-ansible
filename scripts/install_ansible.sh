#!/bin/bash

# Author: williams kamga tamgno
# Date: 02/15/2022
# Contact: williamskamga0@gmail.com
# Description: This script help to install ansible on a ubuntu machine
# Attention! this script should only be use for development and curiosity purpuse.




echo "System preparation to run ansible..."

echo "TASK[0]: System updating ..."

sudo apt-get update -y

sleep 2

echo "TASK[1]: Installing python 3 version and Pip"

sleep 2

sudo apt-get install python3 python3-pip -y


if [ $? -ne 0]
then 
    echo "Something went wrong during python installation."
    exit 1
fi

echo "TASK[2]: Installing ansible"

sudo apt-get install ansible -y

sleep 2

if [ $? -ne 0]
then 
    echo "Something went wrong during ansible installation."
    exit 1
fi

echo "TASK[3]: Creating user called ansadmin"

sudo useradd ansadmin -d /home/ansadmin -m -p $(openssl passwd -crypt ansadmin)

sleep 3

if [ $? -ne 0 ]
then 
    echo "Something went wrong during ansadmin creation."
    exit 1
fi


echo "TASK[4]: granting sudo access to ansadmin."

echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sleep 3

echo "TASK[5]: Install Docker and starting the docker daemon"

apt-get install docker.io -y

service docker start
service docker enable

echo "TASK[6]: adding ansadmin to the group docker"


