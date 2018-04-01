#!/bin/sh
mvn clean package && docker build -f Dockerfile.tomee -t pingperf-tomee .
