#!/bin/bash

oc login -u admin -p redhatocp https://api.ocp4.example.com:6443

# Ravee added this
# oc login -u developer -p developer https://api.ocp4.example.com:6443

#Provide Permission
oc policy add-role-to-user view developer -n openshift-image-registry > /dev/null 2>&1

oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge > /dev/null 2>&1

#Create Project for 2nd Question
oc new-project xerter > /dev/null 2>&1

oc new-app --name repure --image=quay.io/redhattraining/hello-world-nginx > /dev/null 2>&1

oc policy add-role-to-user view developer > /dev/null 2>&1


#Create Project for 3rd Question
oc login -u developer -p developer > /dev/null 2>&1

oc new-project openin > /dev/null 2>&1

oc new-app --name=ziner --as-deployment-config php:7.3~https://github.com/ex288-user/ex288-postcomm.git > /dev/null 2>&1

oc logout > /dev/null 2>&1

echo 'Done'
