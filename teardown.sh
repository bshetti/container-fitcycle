#!/bin/bash
kubectl delete secret mysql-pass
kubectl delete -f fitcycle-percona-pv.yaml
kubectl delete -f mysql-cnf-configmap.yaml
kubectl delete -f mysql-configmap.yaml
kubectl delete -f fitcycle-percona-dcnf.yaml
kubectl delete -f fitcycle-percona-service.yaml
kubectl delete -f api-server-local-total.yaml
kubectl delete -f fitcycle-server-total.yaml

