# my-helm-charts
My Helm charts

## Setup

```shell script
export HELM_HOME="${HOME}/.helm/"
echo "export HELM_HOME=\"${HELM_HOME}\"" \
| tee -a  "${HOME}/.bashrc"

mkdir \
    --parent \
    --mode 777 \
    "${HELM_HOME}"

cd "${HELM_HOME}"

rm -rf "my-helm-charts"

git clone "https://github.com/ivasilyev/my-helm-charts.git"

cd my-helm-charts
```