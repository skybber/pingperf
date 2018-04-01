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

|Microprofile|Start time|Docker mem usage|Throughput req/s|JAVA_OPTS|
|------------|----------|----------------|----------------|---------|
|Meecrowave 1.2.0|1s|170MB|1600/s|-Xmx128m|
|Open Liberty 17.04|4s|475MB|1570/s||
|Payara Micro 5.181|16s|308MB|200-400/s|-Xmx64m|
|Tomee 7.0.4|2s|450MB|1550/s||
|Wildfly 11.0|4s|510MB|1580/s||
