# Kubernetes Overview

## Kubernetes cheatsheet
- Get all pods:
```bash
kubectl get pods -n NAMESPACE
```

- Get all services:
```bash
kubectl get services
```

- Describe pod:
```bash
kubectl describe pod PODNAME -n NAMESPACE
```

- Delete pod:
```bash
kubectl delete pod PODNAME
```

- Delete and install (Replace) pod:
```bash
kubectl get pod PODNAME -n NAMESPACE -o yaml | kubectl replace --force -f -
```

- Other (place later):
```bash
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
```

## Helm
Hepls manage Kubernetes applications.

Official website: https://www.helm.sh

### Helm cheatsheet
- Init helm:
```bash
helm init --service-account SERVICE_ACCOUNT_NAME --upgrade
```

- Install chart:
```bash
helm install chart-dir/ --name RELEASE_NAME
```

- Update repo:
```bash
helm repo update
```
