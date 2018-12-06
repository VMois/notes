# Pandas

Software library for data manipulation and analysis written in Python.

## Data Structures

Main data structures in Pandas are:

- Series - one dimensional (1D) labeled array
- DataFrame - two dimensional (2D) labeled data structure with columns and rows (like SQL table).

## Useful tricks

- check how much memory Pandas dataframe is using:

```python
df.memory_usage()
df.memory_usage(index=True) # include indexes
df.memory_usage(index=True).sum() # include indexes and sum result to overall value
```
