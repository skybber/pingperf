#!/bin/sh
mvn clean package && docker build -f Dockerfile.kumuluzee-micro -t pingperf-kumuluzee-micro .
docker run -ti --rm -p 8080:8080 pingperf-kumuluzee-micro
