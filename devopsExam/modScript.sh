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



echo "=== NODE CONFIGURATION COMPLETED ========================================"