#!/bin/sh
mvn clean package && docker build -f Dockerfile.meecrowave -t pingperf-meecrowave .
docker run -ti --rm -p 8080:8080 pingperf-meecrowave
