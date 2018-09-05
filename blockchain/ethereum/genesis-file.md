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
You can find explanation of file parametrs in this [answer](https://ethereum.stackexchange.com/questions/2376/what-does-each-genesis-json-parameter-mean).