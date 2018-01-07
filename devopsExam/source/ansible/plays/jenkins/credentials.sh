#!/bin/bash

JENKINS_CRUMB=$(curl -s 'http://admin:admin@192.168.89.12:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

curl -s -XPOST -H ${JENKINS_CRUMB} http://admin:admin@192.168.89.12:8080/credentials/store/system/domain/_/createCredentials \
--data-urlencode 'json={
  "": "0",
  "credentials": {
    "scope": "GLOBAL",
    "id": "0000",
    "username": "vagrant",
    "password": "vagrant",
    "description": "shellGrantedCredentials",
    "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
  }
}'