     (                      (
     )\ )                   )\ )            (
    (()/( (          (  (  (()/(   (   (    )\ )
     /(_)))\   (     )\))(  /(_)) ))\  )(  (()/(
    (_)) ((_)  )\ ) ((_))\ (_))  /((_)(()\  /(_))
    | _ \ (_) _(_/(  (()(_)| _ \(_))   ((_)(_) _|
    |  _/ | || ' \))/ _` | |  _// -_) | '_| |  _|
    |_|   |_||_||_| \__, | |_|  \___| |_|   |_|
                    |___/

# Performance tests of java [MicroProfiles](https://microprofile.io/) and Spring-Boot

## Motivation

Docker based comparision of java MicroProfiles and Spring-Boot using simple ping REST request. Docker images are based
on images from [hotswap-docklands](https://github.com/HotswapProjects/hotswap-docklands). Spring-Boot test application 
is available at [Pingperf-spring-boot](https://github.com/skybber/pingperf-spring-boot) .


## Quick start

* run `build-X.sh` to build docker image for given microprofile or app server
* send REST requests as fast as possible (in single thread) : `./perf-utils/echo_test.py`
* monitor performance : `watch "docker stats --no-stream --no-trunc && echo && ./perf-utils/ping_statistics.py"`

## Results

### Single thread

|Microprofile|Start time|Docker mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.1|0.9s|150MB|1580/s|-Xmx64m|
|Open Liberty 17.04|4s|475MB|1570/s||
|Payara Micro 5.181|16s|308MB|200-400/s|-Xmx64m|
|Wildfly Swarm 2018.3.3|5s|335MB|1590/s|-Xmx64m|
|Tomee 7.0.4|2s|450MB|1550/s||
|Wildfly 11.0|4s|510MB|1580/s||
|Spring-Boot 2.0.1|1.9s|850MB|1640/s|-Xmx64m|

### 5 client threads

|Microprofile|Start time|Docker mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.1|0.9s|155MB|6000/s|-Xmx64m|
|Open Liberty 17.04|4s|900MB|5650/s||
|Payara Micro 5.181|16s|---|---/s|-Xmx64m|
|Wildfly Swarm 2018.3.3|5s|315MB|5750/s|-Xmx64m|
|Tomee 7.0.4|2s|MB|/s||
|Wildfly 11.0|4s|MB|/s||
|Spring-Boot 2.0.1|1.9s|1.1GiB|6100/s|-Xmx64m|

## RaspberryPI

Motivation of this test is to check ability to run MicroProfile application on RaspberyPi3.

|Microprofile|Start time|Mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.0|9s||250/s||
