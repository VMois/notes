# Apache Hadoop

- store data in **HDFS** (Hadoop Distributed File System)
- process data in **MapReduce**

## Hadoop Ecosystem

- Hive
- Pig
- Impala
- HBase
- Mahout (machine learning library)

## HDFS

- DataNode
- NameNode - stores metadata of files/data

A file is seperated into blocks of 64MB. Then, each block is copied on three different machines.

## MapReduce

Process data in parallel. Hadoop deals with the data in form of key/value format.

1. Mappers - deal with relative small amount of data in parallel
2. Shuffle - move data to Reducers
3. Reducers - sort that data and produce results

*JobTracker* - splits the work into mappers
*TaskTracker* - runs on each of DataNode
