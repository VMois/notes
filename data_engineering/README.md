# Data Engineering

## Designing Data Intensive Applications notes

Notes from "Designing Data Intensive Applications" book.

Latency is **not equal** response time. *Response time* is what client sees (service delay, network delays, etc.). *Latency* is the duration that a request is waiting to be handled (awaiting service).

Response time is not a single number, it is a distribution. 
Avarage **is not good** for response time measurment. Usually, mean (50th percentile, p50) or 99th (p99), 99.9th (p999) percentile is better option.

## Tools

- [Apache Airflow](https://airflow.apache.org), tasks scheduling and monitoring
- [Dask](https://dask.org) scalable analytics in Python

## Storage formats

- [Apache Parquet](https://parquet.apache.org/documentation/latest/), columnar storage format for efficient data storage

## Useful stuff

- check how much memory Pandas dataframe is using:

```python
df.memory_usage()
df.memory_usage(index=True) # include indexes
df.memory_usage(index=True).sum() # include indexes and sum result to overall value
```

## Resources

- [Awesome Data Engineering list](https://github.com/igorbarinov/awesome-data-engineering#readme)
