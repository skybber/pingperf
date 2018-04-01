#!/bin/sh
mvn clean package && docker build -f Dockerfile.openliberty-micro -t pingperf-openliberty-micro .
docker run -ti --rm -p 8080:9080 pingperf-openliberty-micro
