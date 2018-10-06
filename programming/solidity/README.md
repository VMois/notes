# Solidity

It is the programming language for **Ethereum** blockchain.

Features:

- statically typed

## Quick overview

Simple overview of Solidity programming language. References:

- [Cryptozombies](https://cryptozombies.io)
- [Solidity docs](https://solidity.readthedocs.io)

### Contract

The fundamental block of Solidity is a **contract**. All functions, variables belong to it.

```javascript
contract HelloWorld {

}
```

### Version pragma

All Solidity source code should start with "pragma version" definition. It defines what version of Solidity contract is using.

```solidity
pragma solidity ^0.4.21;

contract HelloWorld {

}
```

### Variables

State variables are permanetly stored in contract storage.

```solidity
contract HelloWorld {
  uint myVar = 5;
}
```

**uint** - is an alias for uint256 or 256 bit unsigned integer (non-negative integer). There are also *uint8*, *uint16* etc.

**int** - is an alias for int256 or 256 bit signed integer. There are also *int8*, *int16* etc.

### Structs

Structs allow to create more complex data types.

Declaration of struct:

```javascript
struct Person {
    uint age;
    string name;
}
```

Defining your struct variable:

```javascript
Person mike = Person(18, "Mike");
```

Creating array of structs and add value to it:

```javascript
Person[] people;
Person adam = Person(20, "Adam");

people.push(adam)
// or
people.push(Person(20, "Adam"));
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

You can add value to **the end of the array** by using `push()` method:

```javascript
uint[] numbers;
numbers.push(2)
numbers.push(4)
numbers.push(8)
// numbers -> [2, 4, 8]
```

### Functions

```javascript
function addPerson(string _name, uint _age) {

}
```

*Note: it's good practice to start name your function parameters with **_** (underscore) to seperate them from global variables*

#### Public/private functions

By default functions in Solidity are **public**. This means anyone (or any other contract) could execute your code. It is dangerous and could make your contract vulnerable to attacks. So, It is a good practice **to make all your functions private by default** and make public only functions that you want to expose to the world.

Creating a private function:

```javascript
function _addPerson(string _name, uint age) private {

}
```

Only other functions within your contracts would be able to use this function.

*Note: It's convention to start private function names with an underscore (_)*

#### Internal/External functions

**Internal** is the same as **private**, except that it's also accessible to contracts that inherit from this contract.

**External** is similar to **public**, except that these functions can **ONLY** be called outside the contract — they can't be called by other functions inside that contract.

#### Return value in functions

If you want to return value from function, the declaration looks like this:

```javascript
string helloWorld = "Hello World";

function sayHelloWorld() public returns (string) {
  return helloWorld;
}
```

#### Function modifiers

[in future]

### Keccak256

[in future]

### Events

**Events** are a way for your contract to communicate that something happened on the blockchain to your app front-end,which can be 'listening' for certain events and take action when they happen.

```javascript
// declare the event
event PersonAdded(
  string _name,
  uint _age
);


function addPerson(string _name, uint _age) public {
  Person newPerson = Person(_age, _name);
  people.push(newPerson);

  // fire an event to let the app know the function was called:
  PersonAdded(_name, _age);
}
```

### Addresses

Ethereum is made up of accounts. Each account has an **address**. *An address is owned by specific user or smart contract*.

### Mapping

Mapping it is simple key -> value storage. Example:

```javascript
mapping(address => uint) public accountsBalance;
```

In this example **the key** is an *address*, and  **the value** is a *uint*.

### Global variables

Solidity has the certain global variables that are available for all functions. Some of popular variables:

```javascript
msg.sender // address of user that called function
msg.value  // number of wei sent with the message (with function call)
```

[Global variables Solidity docs](https://solidity.readthedocs.io/en/v0.4.21/units-and-global-variables.html#block-and-transaction-properties)

### Error handling

There several built in function to handle errors in Solidity:

```javascript
require(bool cond) // throws if the condition is false - to be used for errors in inputs or external components.

assert(bool cond) // throws if the condition is false - to be used for internal errors.
```

### Contract inheritance

In Solidity, you can inherit from contracts.
Example:

```javascript
contract Vehicle {
  function start() public returns (string) {
    return "Vechicle start";
  }

  function stop() public returns (string) {
    return "Vechicle stop";
  }
}

contract Car is Vehicle {
  function playRadio() public returns (string) {
    return "Car play radio";
  }
}
```

Car **inherits** from Vehicle. Now Car contract has access to all **public** functions that Vehicle has (e.g start and stop).

### Import

You can import code to you contact, from another using **import** keyword. Example:

```javascript
import "./animalcontract.sol";

contact Car is AnimalContract {

}
```

### Storage and memory

**Storage** - permanent storage on blockchain,

**Memory** - temporary variables

*Note: State variables (variables declared outside of functions) are by default storage. Variables declared inside functions are memory and will disappear when the function call ends.*
Examples:

```javascript
Person storage person = people[0];
// Now you will get pointer to people[0] in storage so
person.name = 'New Name';
// will permanently change name of people[0] to 'New Name'

// if you want only get a copy
Person memory person = people[0];
// now any modifications of person wouldn't affect permanent storage. If you want to save (replace) your copy
people[0] = person;
```
