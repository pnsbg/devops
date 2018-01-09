#!/bin/bash

sleepsec="40"

echo -e ">>> Create DB container..."
java -jar /opt/jenkins-cli.jar -s http://jhost.sulab.exam:8080 -auth admin:admin build -s doDbContainer

echo -e ">>> sleep $sleepsec sec..."
sleep $sleepsec
  
echo -e ">>> Create PHP container..."
java -jar /opt/jenkins-cli.jar -s http://jhost.sulab.exam:8080 -auth admin:admin build -s doPhpContainer
  
echo -e ">>> Create NGINX container..."
java -jar /opt/jenkins-cli.jar -s http://jhost.sulab.exam:8080 -auth admin:admin build -s doWebContainer
