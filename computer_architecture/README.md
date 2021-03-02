# Computer Architecture

## Classification:

- SISD
- SIMD
- MISD
- MIMD

## Neumann principles

- program must be stored internally
- data and instructions are stored on the same medium (RAM) in the same format
- sequantial instruction execution (changing for newer processors)
- memory is addressed sequentially in one dimension
- numbers and all data are in base 2 (binary)

Single bus

connects different modules (CPU, I/O, Memory, etc.). Possible raise condition.
Simple.

Two/multi dimensional switch matrix

You can use matrix of buses to have multiple possible acceses.
But structure is complex.

## Performance

Tma - time required for measurment algorithm
Ia - instructions in algorithm
Cn - average number of cycles per instruction
T - clock period (1/f)

Tma = Ia*Cn*T
P = 1/Tma

## Principle of locality

- Spatial, if memory location is accessed at particular time, then it is likely that nearby locations will be accessed in the near future.

- Temporal, if memory location is accessed at particular time, that the same memory location is likely to be accessed in the near future.

## Memory layout

- CPU <=> cache (L1,L2,L3) <=> operative memory <=> background storage
- upper level contains a subset of the lower (except transient states for short time)
- transfer between layers in blocks, not bytes
- efficiency defined by effective searching and hit rate
- hit rate, Hr = found in cache/all access
- miss rate, Mr = 1-Hr

## Cache

Tc - cache access time
Tom - operative memory access time
Tl - latency of access to memory

Tl = Hr*Tc + (1-Hr)*Tom

## Cache organization

- placement policy
- fetch policy
- update policy
- block replacement policy

## Placement policy

Where to load a given block of operative memory, to which cache *line*. [wiki page](https://en.wikipedia.org/wiki/Cache_placement_policies)

Policies:

- direct mapping (TAG, Index, offset)
- set associative mapping (TAG, Index, offset, multiple direct mapping caches)

## Fetch policy (when to load a block?)

when to load a new block?

- in case of miss
- before it is needed
- selectively

## Update policy

how to handle writes to cache and OM?

### Write through policy

- in case of a HIT, write to CACHE and to OM as well
- in case of a MISS:
- - write through without write allocate (writes only to OM)
- - write through with write allocate (loads block to cache, and write in both places)


### Write back policy

- with and without write allocate
- in case of HIT, write cache only, and the OM later

### Data consistency

- clear valid bits in cache when written
- write buffer handling (order of read/write, etc.)
- MESI protocol for multiprocessor systems

## Block replacement policy

If no space left in cache, what should be deleted to store a new block?

- not needed for **direct mapping**
- associative or set associative:
- - LRU (least recently used)
- - LFU (least frequently used)
- - FIFO (first in-first out)
- - Random (pretty good actually)
- write policy can modify replacement policy

### Real-LRU 

Matrix of *n* x *n*, where *n* is number of sets, Values are **1** and **0**.

Operations:

1. When i-th set is accessed, put 1s to the i-th row of matrix
2. put 0s to the i-th column of matrix
3. Row(s) full of 0s are showing the least recently used set.

### Pseudo LRU

Using binary tree. Point away from accessed set.

## Fast block load

- memory interleave (multiple memory banks, DDR)

## Logical address

- Bank switching (select blocks)
- index register mapping

## Virtual memory

expands the whole address space (logical address) the background storage to virtual address.
Memory Management Unit (hardware or software).

page/segment oriented virtual memory.

TLB (Translation Lookaside Buffer):

- cache after TLB (slow, simple)
- cache before TLB (fast, complex)

Multilevel page table: page directory -> page tables -> pages
