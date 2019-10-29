# Data Engineering

Table of contents

1. [Visualization](visualization/)
2. [Tools](#tools)
3. [Resources](#resources)
4. [Definitions](#definitions)

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

## Definitions

- **3V** - Volume, Variety, Velocity
- **Data lake** - a data lake is a storage repository that holds a vast amount of raw data in its native format until it is needed.
- **ETL** - Extract, Transform, Load
