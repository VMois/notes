# Quantum Computing

Quantum computing is based on laws of quantum physics. Quantum objects behavior is described by **probability**. It is different from the **deterministic** approach used in classical mechanics.

Quantum computer directly uses quantum objects to perform a specific computation. If we are able to map computational problems onto quantum objects, we are able to use it to our advantage. If a problem has a quantum aspect, we can expect to gain speed up.

Quantum computer operates on **qubits**.

Quotes from Briliant:

> In a real sense, quantum computers do not compute at all, but simply carry on according to the laws of physics. The extent to which quantum computing can revolutionize computation depends on our finding ways to restate computational problems in equivalent quantum systems.
> Suppose we create a shape out of wire, dip it into a bath of soapy water, lift it out, and allow things to settle down. This complex calculation is performed in **real time** by the laws of physics, while it takes **several seconds** even on a powerful modern computer using a non-linear solver.

## Galton board game

Another names Pachinko (Jap.) or Plinko (Eng.). Interesting game to explain difference between classical and quantum computer. Instead of balls, let's use photons. Photons can interfere with each other (cancel or add). More later...

## Quantum bits

The two states of qubit are called |1> and |0> (this symbol is called a **ket**).

**Superposition state**, qubit can exist in any combination of these:

```
a|0> + b|1>
```

*a* and *b* could be any **complex numbers**.

In the most common way of describing a superposition state, the probability of measuring one of the two basis states can be found by finding the relative **squared magnitude** of each of the coefficients. General formula:

```
P(|0>) = a^2 / (a^2 + b^2)

P(|1>) = b^2 / (a^2 + b^2)
```

After you measure a qubit and found one of the states (|0> or |1>) it will forevermore be found in the same state. Measurement changes the state and all other info in that state is lost. **You can get only one measurement!**

## Quantum gates

NOT gate -> X gate (in quantum computer)

Quantum gate called **H** (Hadamard gate) designed to prepare a superposition state:

```
|0> -> H -> |0> + |1> 
```

H gate is often the first choice to transform a classical algorithm into a quantum one.

Another property of H gate:

```
|0> + |1> -> H -> |0>

|0> - |1> -> H -> |1>
```

## Quantum parallelism

Later...

## Learning resources

[Brilliant](https://brilliant.org)
[Quantum Computing for Computer Scientists (Microsoft Research)](https://www.youtube.com/watch?v=F_Riqjdh2oM&list=WL&index=3&t=0s)
