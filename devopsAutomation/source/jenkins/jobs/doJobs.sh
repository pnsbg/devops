#!/bin/bash

sleepsec="35"

echo -e ">>> Create DB container..."
java -jar /opt/jenkins-cli.jar -s http://jenkins:8080 -auth admin:admin build -s doDbContainer

echo -e ">>> sleep $sleepsec sec..."
sleep $sleepsec
  
echo -e ">>> Import DB container..."
java -jar /opt/jenkins-cli.jar -s http://jenkins:8080 -auth admin:admin build -s importDbContainer
  
echo -e ">>> Create WEB image..."
java -jar /opt/jenkins-cli.jar -s http://jenkins:8080 -auth admin:admin build -s doWebImage
  
echo -e ">>> Create WEB container..."
java -jar /opt/jenkins-cli.jar -s http://jenkins:8080 -auth admin:admin build -s doWebContainer
