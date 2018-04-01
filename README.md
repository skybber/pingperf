## JaxRS ping test

* run `build-X.sh` to build docker image with given microprofile or app server
* send REST requests as fast as possible (in single thread) : `./perf-utils/echo_test.py`
* monitor performance : `watch "docker stats --no-stream --no-trunc && echo && ./perf-utils/ping_statistics.py"`

## Results

|Microprofile|Start time|Docker mem usage|Throughput req/s|
|------------|----------|----------------|----------------|
|Meecrowave 1.2.0|1s|170MB|1600/s|
|Open Liberty 17.04|4s|475MB|1570|
|Payara Micro 5.181|16s|308MB|200-400/s|
|Tomee 7.0.4|2s|450MB|1550/s|
|Wildfly 11.0|4s|510MB|1580/s|
