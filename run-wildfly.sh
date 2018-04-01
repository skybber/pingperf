#!/bin/sh
mvn clean package && docker build -f Dockerfile.wildfly -t pingperf-wildfly .
docker run -ti --rm -p 8080:8080 pingperf-wildfly
