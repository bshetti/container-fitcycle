#!/bin/bash
set -x
kubectl create secret generic mysql-pass --from-literal=password=$1
./setHeapster.sh $2
kubectl create -f ./wavefront/proxy/wavefront-proxy.yaml
kubectl create -f ./wavefront/proxy/wavefront-service.yaml
kubectl create -f fitcycle-percona-pv.yaml
kubectl create -f mysql-cnf-configmap.yaml
kubectl create -f mysql-configmap.yaml
kubectl create -f fitcycle-percona-dcnf.yaml
kubectl create -f fitcycle-percona-service.yaml
kubectl create -f api-server-local-total.yaml
kubectl create -f fitcycle-server-total.yaml
kubectl create -f mobile-server-total.yaml
./setingress.sh $2
