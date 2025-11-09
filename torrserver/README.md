```shell script
export TOOL_NAME="torrserver"
export TOOL_RELEASE="${TOOL_NAME}-0.1"
export TOOL_DIR="/data/{TOOL_NAME}/"
sudo mkdir \
    --parent \
    --mode 0777 \
    --verbose \
    "${TOOL_DIR}" \

cp -v "torrserver/accs.db" "${TOOL_DIR}"
# nano "${TOOL_DIR}/accs.db"

sudo helm template "${TOOL_RELEASE}" ./torrserver --set volumes.hostPath="$(realpath "${TOOL_DIR}")"

sudo helm install "${TOOL_RELEASE}" ./torrserver --set volumes.hostPath="$(realpath "${TOOL_DIR}")"

sudo helm uninstall torrserver-0.1
```
