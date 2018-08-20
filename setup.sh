#!/bin/bash
kubectl create secret generic mysql-pass --from-literal=password=$1
kubectl create -f fitcycle-percona-pv.yaml
kubectl create -f mysql-cnf-configmap.yaml
kubectl create -f mysql-configmap.yaml
kubectl create -f fitcycle-percona-dcnf.yaml
kubectl create -f fitcycle-percona-service.yaml
kubectl create -f api-server-local-total.yaml
kubectl create -f fitcycle-server-total.yaml

