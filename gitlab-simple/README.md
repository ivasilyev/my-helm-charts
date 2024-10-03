# Simple GitLab chart

A simple Helm chart to deploy the `gitlab/gitlab-ce` app on a cluster and exposing it using 
the `LoadBalancer` service type.

```shell script
export TOOL_NAME="gitlab"
export HELM_CHART_NAME="${TOOL_NAME}-simple"
export HELM_CHART_RELEASE_NAME="${HELM_CHART_NAME}-release"
export TOOL_DATA_DIR="/data03/bio/srv/${TOOL_NAME}/"

helm uninstall gitlab-simple-release
sudo rm -rfv "${TOOL_DATA_DIR}"

sudo mkdir \
    --parent \
    --mode 0777 \
    --verbose \
    "${TOOL_DATA_DIR}config" \
    "${TOOL_DATA_DIR}data" \
    "${TOOL_DATA_DIR}logs"

sudo chmod \
    --recursive 777 \
    "${TOOL_DATA_DIR}"

helm install "${HELM_CHART_RELEASE_NAME}" ./"${HELM_CHART_NAME}"

helm describe "${HELM_CHART_RELEASE_NAME}"

helm list --all-namespaces

curl http://10.48.15.251:80  # HTTP 502: Waiting for GitLab to boot

ls "${TOOL_DATA_DIR}data"

kubectl get services

kubectl describe service "${HELM_CHART_NAME}-service"

kubectl get deployments

kubectl describe deployment "${HELM_CHART_NAME}-deployment"

export TOOL_POD="$(
    kubectl get pods \
    | grep \
        --perl-regexp \
        --only-matching \
        "${HELM_CHART_NAME}[^ ]*"
)"

kubectl logs \
    "${TOOL_POD}" \
    --follow \
    --since 1m

kubectl describe pod "${TOOL_POD}" \
| grep 'Node'  # node05

curl http://node05:32767

ssh 10.48.15.251  #  Permission denied (publickey).
```
