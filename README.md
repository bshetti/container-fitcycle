# container-fitcycle

Instructions on getting this application up in a cluster:

All instructions below are based in whatever your default namespace is. If you want to add to a specific namespace then add -n=NAMESPACE

Bring up the Database:
kubectl create configmap db --from-literal=mysql-database: prospect
kubectl create secret generic mysql-pass --from-literal=password=YOUR_PASSWORD
kubectl create -f fitcycle-mysql-pv.yaml
kubectl cp prospect.sql fitcycle-mysql-2991951145-7rkq5:prospect.sql
kubectl exec -it [POD NAME] — /bin/bash
mysql -u root -p prospect < prospect.sql


kubectl create -f api-server-local.yaml
