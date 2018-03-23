#!/bin/sh
mvn clean package && docker build -f Dockerfile.tomee -t pingperf-tomee .
docker run -ti --rm -p 8080:8080 pingperf-tomee
