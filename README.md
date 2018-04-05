     (                      (
     )\ )                   )\ )            (
    (()/( (          (  (  (()/(   (   (    )\ )
     /(_)))\   (     )\))(  /(_)) ))\  )(  (()/(
    (_)) ((_)  )\ ) ((_))\ (_))  /((_)(()\  /(_))
    | _ \ (_) _(_/(  (()(_)| _ \(_))   ((_)(_) _|
    |  _/ | || ' \))/ _` | |  _// -_) | '_| |  _|
    |_|   |_||_||_| \__, | |_|  \___| |_|   |_|
                    |___/

# Performance tests of java [MicroProfiles](https://microprofile.io/)

## Motivation

Docker based comparision of java MicroProfiles using simple ping REST request. Docker images are based
on images from [hotswap-docklands](https://github.com/HotswapProjects/hotswap-docklands).

## Quick start

* run `build-X.sh` to build docker image for given microprofile or app server
* send REST requests as fast as possible (in single thread) : `./perf-utils/echo_test.py`
* monitor performance : `watch "docker stats --no-stream --no-trunc && echo && ./perf-utils/ping_statistics.py"`

## Results

### Single thread

|Microprofile|Start time|Docker mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.0|1s|160MB|1580/s|-Xmx64m|
|Open Liberty 17.04|4s|475MB|1570/s||
|Payara Micro 5.181|16s|308MB|200-400/s|-Xmx64m|
|Wildfly Swarm 2018.3.3|5s|335MB|1590/s|-Xmx64m|
|Tomee 7.0.4|2s|450MB|1550/s||
|Wildfly 11.0|4s|510MB|1580/s||

### 5 client threads

|Microprofile|Start time|Docker mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.0|1s|153MB|5850/s|-Xmx64m|
|Open Liberty 17.04|4s|900MB|5600/s||
|Payara Micro 5.181|16s|---|---/s|-Xmx64m|
|Wildfly Swarm 2018.3.3|5s|315MB|5750/s|-Xmx64m|
|Tomee 7.0.4|2s|MB|/s||
|Wildfly 11.0|4s|MB|/s||

## RaspberryPI

Motivation of this test is to check ability to run MicroProfile application on RaspberyPi3.

|Microprofile|Start time|Mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.0|9s||250/s||
