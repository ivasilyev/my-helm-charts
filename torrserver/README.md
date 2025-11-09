```shell script
sudo helm template torrserver-0.1 ./torrserver --set Values.volumes.hostPath="/data"
```