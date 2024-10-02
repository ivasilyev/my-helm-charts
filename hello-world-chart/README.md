# Hello World chart

A simple Helm chart to deploy the `nginxdemos/hello` app on a cluster and exposing it using 
the `LoadBalancer` service type.

```shell script
helm uninstall hello-world-release

helm install hello-world-release ./hello-world-chart

helm status hello-world-release

kubectl get service

kubectl describe service hello-world-chart-service

curl 10.48.15.210:32767
```

```text
Server address: 10.233.74.197:80
Server name: hello-world-chart-hello-world-5747887765-glqsc
Date: 02/Oct/2024:17:41:19 +0000
URI: /
Request ID: 14c69cb26e58120dfe6538287d630a70
```
