# docker grafana

## usage

build.

```bash
$ docker build -t `whoami`/grafana .
```

run.

```bash
$ docker run -t -i --rm  \
   -e GRAPHITE_SCHEME=http \
   -e GRAPHITE_HOST=localhost \
   -e GRAPHITE_PORT=2003 \
   -e ES_SCHEME=http \
   -e ES_HOST=localhost \
   -e ES_PORT=9200 \
   -p 80:80 \
   -p 8083:8083 \
   -p 8086:8086 \
   `whoami`/grafana
```

Doug Tangren (softprops) 2014
