# Google Cloud Platform

## Useful links

- [Node pools managing](https://cloud.google.com/kubernetes-engine/docs/how-to/node-pools)

## Useful commands

### Kubernetes cluster

1. [Resize cluster](#resize-cluster)
2. [Disable/shutdown cluster](#disable-cluster)
3. [Enable autoscaling](#cluster-autoscaling)
4. [Disable autoscaling](#cluster-autoscaling)

#### Resize cluster

```bash
gcloud container clusters resize CLUSTER_NAME --node-pool NODE_POOL --size NODES_NUMBER
```

#### Disable cluster

**IMPORTANT!** Cluster autoscaling must be disable

```bash
gcloud container clusters resize CLUSTER_NAME --node-pool NODE_POOL --size 0
```

### Cluster autoscaling

For existing cluster:

- enable

```bash
gcloud container clusters update CLUSTER_NAME --enable-autoscaling --min-nodes=1 --max-nodes=16
```

- disable

```bash
gcloud container clusters update CLUSTER_NAME --no-enable-autoscaling
```