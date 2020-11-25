# Distributed systems

## Resource

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
