# Docker image for Prometheus Pushgateway on arm64 architecture

Lightweight docker image for Pushgateway on arm64 architecture.

* Simple Run
```
docker run -d -p 9091:9091
           --name pushgateway
           mqll/pushgateway-arm64
```

* With options
```
docker run -d -p 9091:9091
           --name pushgateway
           -v /hostpath:/tmp
           mqll/pushgateway-arm64
           --persistence.file=/tmp/persistent_file
```
