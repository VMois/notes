# Kubernetes

## Useful commands

1. [Get all pods](#get-pods)
2. [Get all services](#get-services)
3. [Describe pod](#describe-pod)
4. [Delete pod](#delete-pod)
5. [Get cluster information](#get-cluster-information)
6. [Recreate pod](#recreate-pod)
7. [Get shell on a pod](#get-shell-on-a-pod)

### Get pods

```bash
kubectl get pods -n NAMESPACE
```

### Get services

```bash
kubectl get services
```

### Describe pod

```bash
kubectl describe pod PODNAME -n NAMESPACE
```

### Delete pod

```bash
kubectl delete pod PODNAME
```

### Get cluster information

```bash
kubectl cluster-info
```

### Recreate pod

Delete and install (replace) pod

```bash
kubectl get pod PODNAME -n NAMESPACE -o yaml | kubectl replace --force -f -
```

### Get shell on a pod

```bash
kubectl exec -it POD_NAME -- /bin/bash
```

## Helm

Hepls manage Kubernetes applications.

Official website: https://www.helm.sh

### Useful Helm commands

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

- Upgrade chart

```bash
helm upgrade -f [values_filename].yaml RELEASE_NAME ./chart-dir
```
