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

Following performance statistics were measured by JMeter.

### Single thread (user)

|Microprofile|Start time|Docker mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.1|0.9s|150MB|3750/s|-Xmx64m|
|Open Liberty 17.04|4s|500MB|3400/s||
|Payara Micro 5.181|7s|400MB|3400/s|-Xmx128m|
|Wildfly Swarm 2018.3.3|5s|316MB|3200/s|-Xmx64m|
|Tomee 7.0.4|2s|MB|/s||
|Wildfly 11.0|4s|MB|/s||
|Spring-Boot 2.0.1|1.9s|196MB|3900/s|-Xmx64m|

### 10 threads (users)

|Microprofile|Start time|Docker mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.1|0.9s|180MB|24200/s|-Xmx64m|
|Open Liberty 17.04|4s|650MB|34500/s||
|Payara Micro 5.181|7s|340MB|24800/s|-Xmx128m|
|Wildfly Swarm 2018.3.3|5s|340MB|21000/s|-Xmx64m|
|Tomee 7.0.4|2s|MB|/s||
|Wildfly 11.0|4s|MB|/s||
|Spring-Boot 2.0.1|1.9s|235MB|25000/s|-Xmx64m|

## RaspberryPI

Motivation of this test is to check ability to run MicroProfile application on RaspberyPi3.

|Microprofile|Start time|Mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.0|9s||250/s||
