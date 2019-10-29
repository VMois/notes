# Geth (Go Ethereum Client)
### Basic info
Geth works on port **30303** and creates directory in **~/ethereum** (for Linux). In datadirectory geth puts file called **geth.ipc** which:
- used for other provess connecting to geth,
- used by apps like MIST, Ethereum wallet or "geth attach"

### Commands
1. Create private network with first block
```sh
geth --datadir=./chaindata/ init genesis.json
```

2. Run private Ethereum network
```sh
geth --datadir=./chaindata/
```