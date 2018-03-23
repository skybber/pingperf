## JaxRS ping test
* run `buildAndRunDebugX.sh`
* run performance test : `./perf-utils/echo_test.py`
* run some statistics : `watch "docker stats --no-stream --no-trunc && echo && ./perf-utils/ping_statistics.py" `
