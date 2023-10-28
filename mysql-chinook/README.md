# `mysql-chinook`

Helm chart to deploy MySQL server and populate it 
with the [Chinook database](https://github.com/lerocha/chinook-database).

## Setup 

```shell script
cd "${HELM_HOME}my-helm-charts"
git reset --hard
git pull

helm list --all
helm delete "mysql-chinook"

rm -f *.tgz
export CHART="$(helm package mysql-chinook | awk '{print $NF}')"
echo "Install '${CHART}'"
helm install "mysql-chinook" "${CHART}"

kubectl get pods
kubectl get services

echo "Access IP address: $(
    kubectl describe pod "$(
        kubectl get pods \
        | grep --only-matching 'mysql-chinook-deployment[^ \t]*'
    )" \
    | grep 'Node:' \
    | grep --only-matching '[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*'
)"
```
