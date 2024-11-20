help:
	@echo "Switches context to correct kubernetes cluster and then applies helm chart to start spark thrift server"
	# @echo "* start-service-prod deploys the spark-thrift-server-prod"
	@echo "* start-service-dev deploys the spark-thrift-server-stg"

start-service-dev:
	kubectl config use-context stg.ktdev.io --namespace poc
	helm upgrade --install spark-thrift-server . --namespace poc -f values-dev.yaml
