#!/bin/sh
mvn clean package && docker build -f Dockerfile.wildfly -t pingperf-wildfly .
