# Google Cloud Kuberntes

## Useful links

- [Node pools managing](https://cloud.google.com/kubernetes-engine/docs/how-to/node-pools)

## Useful commands

- Resize cluster:

```bash
gcloud container clusters resize CLUSTER_NAME --node-pool NODE_POOL --size NODES_NUMBER
```

- Enable cluster autoscaling for existing cluster:

```bash
gcloud container clusters update CLUSTER_NAME --enable-autoscaling --min-nodes=1 --max-nodes=16
```

- Disable cluster autoscaling for existing cluster:

```bash
gcloud container clusters update CLUSTER_NAME --no-enable-autoscaling
```