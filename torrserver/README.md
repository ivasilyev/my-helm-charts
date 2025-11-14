```shell script
cd "${HELM_HOME}/my-helm-charts"
#
export TOOL_NAME="torrserver"
export TOOL_RELEASE="${TOOL_NAME}-0.1"
export TOOL_DIR="/data/${TOOL_NAME}/"
#
# sudo rm -rf "${TOOL_DIR}"

mkdir \
    --parent \
    --mode 0777 \
    --verbose \
    "${TOOL_DIR}"
sudo chmod \
    --recursive \
    --verbose \
    00777 \
    "${TOOL_DIR}"
sudo chown \
    --recursive \
    --verbose \
    "$(id -u):$(id -g)" \
    "${TOOL_DIR}"

cp -v "torrserver/accs.db" "${TOOL_DIR}"
# nano "${TOOL_DIR}/accs.db"

sudo helm template "${TOOL_RELEASE}" ./torrserver --set volumes.hostPath="$(realpath "${TOOL_DIR}")"

sudo helm install "${TOOL_RELEASE}" ./torrserver --set volumes.hostPath="$(realpath "${TOOL_DIR}")"
sudo kubectl get pods
sudo kubectl get svc

sudo helm uninstall torrserver-0.1
```
