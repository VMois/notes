# Solidity
It is programming language for Ethereum blockchain. Features:
- statically typed

## Quick overview
### Contract
Fundamental block of Solidity is a **contract**. All functions, variables belong to it.
```javascript
contract HelloWorld {

}
```

### Version pragma
All Solidity source code should start with "version pragma". It defines what what version of Solidity contract uses.
```
pragma solidity ^0.4.19;

contract HelloWorld {

}
```

### Variables
State variables are permanetly stored in contract storage.

```
contract HelloWorld {
  uint myVar = 5;
}
```

**uint** - is an alias for uint256 or 256 bit unsigned integer (non-negative integer). There are also *uint8*, *uint16* etc.

**int** - is an alias for int256 or 256 bit signed integer. There are also *int8*, *int16* etc.

### Structs
Structs allow to create more complex data types.
```javascript
struct Person {
    uint age;
    string name;
}
```

### Arrays
Solidity has two types of arrays: **fixed** and **dynamic**. Examples of fixed arrays:
```javascript
// fixed array of 5 uint elements
uint[5] fixedArray;

// fixed array of 10 string elements
string[10] fixedStringArray;
```
And dynamic arrays:
```javascript
// dynamic array of uint, keep growing
uint[] dynamicArray;

// dynamic array of strings
string[] dynamicStringArray;
```

You can also create array of structs:
```javascript
// fixed array of Person's struct
Person[5] fixedArray;

// dynamic array of Person's struct
Person[] dynamicArray;
```

You can declare arrays as *public*:
```javascript
Person[] public people;
```
Solidity will automatically create *getter* methods, so other contracts could read (but not write) from your public array.

### Functions
```javascript
function addPerson(string _name, uint _age) {

}
```
*Note: it's good practice to start name your function parameters with **_** (underscore) to seperate them from global variables*

