#!/bin/sh
mvn clean package && docker build -f Dockerfile.payara-micro -t pingperf-payara-micro .
docker run -ti --rm -p 8080:8080 pingperf-payara-micro
