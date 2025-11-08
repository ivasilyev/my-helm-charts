# my-helm-charts
My Helm charts


## Install Helm

```shell script
export HELM_HOME="${HOME}/.helm"
echo "export HELM_HOME=\"${HELM_HOME}\"" \
| tee -a  "${HOME}/.bashrc"

mkdir \
    --parent \
    --mode 777 \
    "${HELM_HOME}"

cd "${HELM_HOME}"

export TOOL_SCRIPT="${HELM_HOME}/get_helm.sh"

curl -fsSL \
    "https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3" \
    -o "${TOOL_SCRIPT}"
bash "${TOOL_SCRIPT}"
``` 
> ```text
> helm installed into /usr/local/bin/helm
> ```

```shell script
helm version
```

## Setup repository

```shell script
cd "${HELM_HOME}"
rm -rf "my-helm-charts"

git clone "https://github.com/ivasilyev/my-helm-charts.git"

cd my-helm-charts
```

## Install a chart

```shell script
sudo helm template name ./release
sudo helm install name ./release --dry-run
sudo helm install name ./release --dry-run --set key1.key2.key3="value"
sudo helm install name ./release
```

## Uninstall a chart

```shell script
sudo helm template
sudo helm delete name
```
