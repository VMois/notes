# Distributed systems

## Raft

Useful page: https://raft.github.io

Raft is consensus algorithm, easy to understand, practical. Solves problem of replicated state machine.
Needs *2*f-1* servers to tolerate failure of **f** servers. 

Leader election is critical for timing because when leader is not present system is frozen.

```
broadcast time (e.x 0.5ms to 20ms) << electionTimeout (10ms to 200ms) << MTBF (several months)
```

Raft layer is usually sits underneath application layer (as K/V store). 
Application layer will interact with Raft. Raft will interact with other Raft layers on different servers.

Fast-backup of logs for followers is possible by providing additional information for leader such as:

- XTerm, term of conflicting entry
- XIndex, index of first entry with XTerm
- XLen, len of follower log

Persistant state:

- log
- currentTerm
- votedFor

Sync disk update problem -> speed of write to hard drive is slow (use SSD, DRAM with batteries, etc.)

```
Linux
write(fd, ___) -> not guarantee that data there
fsync(fd) -> ensures that data is on drive, expensive operation
```

What if logs grows too big?

Snapshot -> saving app state up to certain log index in Raft and removing every log entry before (we have ap state saved).
Possible that some followers will not be able to catch up due to missing log entries, so, need InstallSnapshotRPC for late followers to be able to catch up.

## From MIT course

Notion of correctness -> Linearizability of history of execution

Execution history is linearizable if:

- exists order of ops that mathes real life for non-concurrent ops
- each read sess most recent write in order

## Resources

- An introduction to distributed systems (https://github.com/aphyr/distsys-class)

- [Notes on distributed systems](https://www.the-paper-trail.org/post/2014-08-09-distributed-systems-theory-for-the-distributed-systems-engineer/)


## My notes

Short notes from [this blog post](https://www.somethingsimilar.com/2013/01/14/notes-on-distributed-systems-for-young-bloods/):

- Distributed systems  are hard because they fail often. Partial failures are especially dangerous, because they can introduce inconsistency. Design for failure.

- Coordination between machines is very hard. Avoid if possible. The real trick of horizontal scalability is independence.

- If you can fit your problem into memory, it's probably trivial.

- Metrics are the only way to get your job done. Logs can be useful, but also can fill the whole space.

- Use percentiles, not average (the same suggestion in book "Designing Data-Intensive Application")

- Learn to estimate your capacity. How many machines you need to perform your job? What size of data need to processed? How many data can fit on one machine etc.?

- Introduce feature flags over big infrastructure updates. Use "flags" to partially roll-out features to production and then gradually move forward.

## Theorems

- [CAP](https://en.wikipedia.org/wiki/CAP_theorem), states that a distributed system cannot provide consistency, availability and partition tolerance at the same time.

- [Fallacies of Distributed Computing](https://en.wikipedia.org/wiki/Fallacies_of_Distributed_Computing), provides list of 8 wrong assumptions that a lot of engineers are taking when designing and building distributed systems.
