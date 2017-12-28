#!/bin/bash

echo "=== BEGIN NODE CONFIGURATION ============================================"

echo ">>> Change /etc/motd ..."
sudo sed -i "s/centos7_clear/$(hostname)/g" /etc/motd
sudo cat /etc/motd

echo "========================================================================="

echo ">>> Set /etc/hosts ..."
sudo echo "10.10.10.11	ansible" >> /etc/hosts
sudo echo "10.10.10.12	jenkins" >> /etc/hosts
sudo echo "10.10.10.13	nagios" >> /etc/hosts
sudo echo "10.10.10.14	docker" >> /etc/hosts
sudo echo "10.10.10.15	web" >> /etc/hosts
sudo echo "10.10.10.16	db" >> /etc/hosts

echo "========================================================================="

echo ">>> Add \"vagrant\" color promt ..."
if grep -Fxq "PS1" /home/vagrant/.bashrc
then
    echo "+++ Color prompt already set"
else
    echo "+++ Color prompt not set. Add color prompt"
    echo "export 'PS1=\[\033[01;32m\][\u@\h \[\033[01;34m\]\w \[\033[01;32m\]]\$ \[\033[00m\]'" >> /home/vagrant/.bashrc
fi

echo "=== NODE CONFIGURATION COMPLETED ========================================"