# genesis.json file in detail
Defines how your genesis block will look like.
### Example file:
```json
{
	"coinbase": "0x3333333333333333333333333333333333333333",
  	"nonce": "0x0000000000000033",
	"timestamp": "0x0",
	"parentHash":"0x0000000000000000000000000000000000000000000000000000000000000000",
	"gasLimit": "0x8000000",
	"difficulty": "0x20000",
	"mixhash":"0x0000000000000000000000000000000000000000000000000000000000000000",
	"alloc": {},
	"config": {
		"chainId": 667788,
		"homesteadBlock": 0,
		"eip155Block": 0,
		"eip158Block": 0
  	}
}
```

### Parametrs:
- **coinbase** (not required) - ?,
- **difficulty** - how difficult is mine a new block,
- **gasLimit** - when you perform any transaction in the blockchain you need to pay gas to the miners. This parametr set upper limit for gas amount.
- **nonce** - ?,
- **mixHash** - ?,
- **parentHash** - ?,
- **timestamp** (not required) - when initial block was generated,
- **alloc** - you can add ether here to pre-allocated accounts,
- **config** (since geth 1.6) - ?