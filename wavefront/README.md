# container-fitcycle

Instructions on getting this application up in a cluster:

All instructions below are based in whatever your default namespace is. If you want to add to a specific namespace then add -n=NAMESPACE

The set up below is also done with NodePort. 

## Bring up the Wavefront Proxy
 in the proxy directory

MAKE SURE YOU HAVE YOUR WAVEFRONT URL AND TOKEN
CORRECT THESE VALUES IN THE wavefront-proxy.yaml file

```yaml
kubectl create -f wavefront-heapster.yaml
kubectl create -f wavefront-proxy.yaml
kubectl create -f wavefront-service.yaml

```

## Bring up the Database:

in the mysql directory

```yaml
kubectl create secret generic mysql-pass --from-literal=password=YOUR_PASSWORD

kubectl create -f telegraf-mysql-configmap.yaml
kubectl create -f mysql-sql-configmap.yaml
kubectl create -f mysql-cnf-configmap.yaml
kubectl create -f fitcycle-pv-create.yaml
kubectl create -f fitcycle-percona-dcnf.yaml
kubectl create -f fitcycle-percona-service.yaml

```

## Bring up the API server

in the flask directory
```yaml
kubectl create -f api-server-deployment.yaml
kubectl create -f api-server-service.yaml
```

## Bring up the web-server

in the django directory
```yaml
kubectl create -f web-server-deloyment.yaml
kubectl create -f web-server-service.yaml
```
## Ensure the NODE PORTS are exposed in AWS

kubectl get services

NOTE the port numbers for the services

```yaml
NAME              TYPE           CLUSTER-IP       EXTERNAL-IP        PORT(S)          AGE
fitcycle-mysql    ClusterIP      None             <none>             3306/TCP         20d
fitcycle-server   LoadBalancer   100.69.2.61      a43b2d31e1612...   8000:31553/TCP   7d
kubernetes        ClusterIP      100.64.0.1       <none>             443/TCP          80d
local-fitcycle    LoadBalancer   100.69.146.247   a6e50fff01608...   5000:31159/TCP   7d
```

## Testing out the API

In a separate machine (local computer connected to the internet) type in the following:

```yaml
curl -i http://35.167.11.105:31159/api/v1.0/signups
```

REPLACE THE IP ADDRESS AND THE PORT NUMBER WITH THE APPROPRIATE IP ADDRESS AND PORT FOR YOUR CLUSTER 

## View the application server

Open up the node port in AWS
go to IP ADDRESS:NODEPORT on a web browser


