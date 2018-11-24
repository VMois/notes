# Conda

## Useful commands

1. [Create env](#create-env)

2. [Activating env](#activating-env)

3. [Deactivating env](#deactivating-env)

4. [Remove env](#remove-env)

### Create env

```bash
conda create --name myenv python=3.6 # create env with specific python version
```

### Activating env

```bash
source activate myenv
```

### Deactivating env

```bash
source deactivate
```

### Remove env

```bash
conda remove --name myenv --all
```