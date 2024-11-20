# Saprk Thrift Server on Kubernetes

Spark SQL can act as a distributed query engine using its JDBC/ODBC or command-line
interface. In this mode, end-users or applications can interact with Spark SQL directly to run
performant SQL queries on Big Data, without the need to write any code.
It might be useful to deploy a spark thrift server in a kubernetes cluster so that users can use spark as
a query engine and run spark SQL queries against Iceberg tables in S3 with Glue as data
catalog.
This project deploys Spark Thrift Server on k8s to use Spark as a Distributed Query Engine to run Spark SQL queries on it.