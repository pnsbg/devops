#!/bin/bash

echo "=== BEGIN NODE CONFIGURATION ============================================"

echo ">>> Change /etc/motd ..."
sudo sed -i "s/centos7_clear/$(hostname)/g" /etc/motd
sudo cat /etc/motd

echo "========================================================================="

echo ">>> Set /etc/hosts ..."
sudo echo "192.168.89.11	ahost.sulab.exam" >> /etc/hosts
sudo echo "192.168.89.12	jhost.sulab.exam" >> /etc/hosts
sudo echo "192.168.89.13	nhost.sulab.exam" >> /etc/hosts
sudo echo "192.168.89.14	dhost.sulab.exam" >> /etc/hosts
sudo echo "192.168.89.15	w.dhost.sulab.exam" >> /etc/hosts
sudo echo "192.168.89.16	d.dnost.sulab.exam" >> /etc/hosts

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