## Overview

[Spark Thrift Server](https://spark.apache.org/docs/latest/sql-distributed-sql-engine.html) is a distributed query engine to run [Spark SQL](https://spark.apache.org/sql/) on big data without the need to write any code.
We have deployed spark thrift server on staging cluster to run spark SQL on [Apache Iceberg](https://iceberg.apache.org/) tables stored in AWS S3.

### Deploy on Staging Cluster

```
cd src/experimental/fiza/spark-thrift-server-poc/
```

1. If you're changing the spark version or making any changes in the `./container/Dockerfile`, rebuild the docker file by running `./container/build.sh` and upload to ecr by running `./container/push.sh`
2. Update the `values-dev.yaml` to point to new image `server.container.image`
3. To deploy spark thrift server on staging cluster, run `make start-service-dev` to
change kubectl context and apply the helm chart
