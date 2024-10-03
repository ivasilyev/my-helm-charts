# Simple GitLab chart

A simple Helm chart to deploy the `gitlab/gitlab-ce` app on a cluster and exposing it using 
the `LoadBalancer` service type.

```shell script
mkdir -p /data03/bio/srv/gitlab
chmod -R 777 /data03/bio/srv/gitlab
cd /data03/bio/srv/gitlab

mkdir -p config
mkdir -p data
mkdir -p logs

helm uninstall gitlab-simple-release

helm install gitlab-simple-release ./gitlab-simple

helm status gitlab-simple-release

curl http://10.48.15.251:80  # HTTP 502: Waiting for GitLab to boot

ls /data03/bio/srv/gitlab/data

kubectl get services

kubectl describe service gitlab-simple-chart-service

kubectl describe pod "$(
    kubectl get pods \
    | grep \
        --perl-regexp \
        --only-matching \
        'gitlab-simple-chart[^ ]*'
)" \
| grep 'Node'  # node09

curl http://node09:32767
```
