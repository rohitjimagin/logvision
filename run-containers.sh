#!/bin/bash
case "$1" in
  "fl")
    docker run --rm --name fluentd -p 24224:24224 -p 24224:24224/udp -v ${PWD}/fluentd/fluentdroutingerror.conf:/fluentd/etc/fluent.conf -v ${PWD}/fluentd/log:/fluentd/log --net elastic -e ELASTICSEARCH_HOST=elasticsearch fluent/fluentd-kubernetes-daemonset:v1.14.3-debian-elasticsearch7-1.0
    ;;
  "el")
    docker run --rm --name elasticsearch --net elastic -p 9200:9200 -e discovery.type=single-node -e ES_JAVA_OPTS="-Xms1g -Xmx1g" -e xpack.security.enabled=false -e "http.host=0.0.0.0" -it docker.elastic.co/elasticsearch/elasticsearch:8.6.1
    ;;
  "kib")
    docker run --rm --name kibana --net elastic -p 5601:5601 kibana:8.6.1
    ;;
  "raillog")
    docker run --rm -it -p 3000:3000 --net elastic -e FLUENTD_HOST=fluentd syntaxhacker/raillog:latest
    ;;
  *)
    echo "Usage: ./run-containers.sh [fl|el|kib|raillog]"
    exit 1
    ;;
esac

exit 0


