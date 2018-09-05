# Ethereum Basic Information
**Ethereum** is an open-source, public, blockchain-based distributed computing platform featuring smart contract functionality. 

Blockchain starts with **first initial block**. All future blocks contain information about transactions/contracts + **part of signature of previous block**:
```
Block X (first block) -> Block X+1 (information + signature of block x) -> Block X+2 (information + signature of block x+1)
```

### The first block in details
- The first block is called **"genesis"** block.
- Genesis block can be configured. In *geth* in *genesis.json*, config file.
- Everybody connects to existing blockchain, but someone starts **genesis** block

### How new block is created
New block need to be mined by miners. Miners are solving mathematical riddles that hard to find answer to, but easy to verify. All this operations are called **Proof of Work** (PoW). It requires a lot of calculaion power (electricity), but guarantees security of blockchain network.

### How is a transaction created?
You need to sign data you want to send to blockchain with your private key. Sended  and validated transaction will be include in the next created block.

### Private, public keys, addresses
- private key is used to sign transactions (**kept in private!**),
- public key used to verify transactions,
- Ethereum address - derived from the public key

### Proof of Stake (PoS)
You need to put in Ether to mine new blocks. It's better for environment (doesn't use a lot of energy). Possible changing from PoW to PoS/PoW (mixed) in 2018.

### Blockchain Node
- implements Ethereum protocol,
- gives access to blockchain,
- provides ability to, for instance, mining etc.

First nodes written in:
- **Go** (Geth) - most popular,
- **C++**,
- **Python**

### Development tools for simulations of the Ethereum protocol (network)
- **Ethereumjs-TestRPC** 
- [**Ganache**](http://truffleframework.com/ganache/)

### Plugins to interact with Ethereum network via browser
#### Metamask
It's plugin for **Chrome/Firefox**. Acts like a bridge (Your browser -> Metamask's servers -> Ethereum blockchain). Can store private keys and doesn't download chain data.

### Some other facts
**Distributed Apps (Dapps)** - they assume you have access to blockchain (unlike in traditional client-server model, where app is stored on server-side)
