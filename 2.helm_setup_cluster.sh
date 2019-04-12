### Overview
# When making clusters type: hub.jupyter.org/node-purpose=core
# At the time of this tutorial I used helm versions 2.11 and jupyterhub version 0.7.0
# Helm Releases: https://github.com/helm/helm/releases
# JupyterHub Releases: https://jupyterhub.github.io/helm-chart/
# Helm Tutorial: https://docs.helm.sh/using_helm/#quickstart-guide

### Download & Set Up Helm
# https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-helm.html
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

#Initialize
kubectl --namespace kube-system create sa tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller

### Unknown step
#kubectl patch deployment tiller-deploy --namespace=kube-system --type=json --patch='[{"op": "add", "path": "/spec/template/spec/containers/0/command", "value": ["/tiller", "--listen=localhost:44134"]}]'


#Verify
helm version
helm repo update

### helm install dask image with 1 scheduler and 3 workers standard with yaml file values
helm install stable/dask -f Custom-Dask/values.yaml

