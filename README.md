# docker grafana

## usage

# build

```bash
$ docker build -t `whoami`/grafana .
```

# run

ports

port | use
-----|-------
80   | web UI

env

var             | default value  | use
----------------|----------------|--------
GRAPHITE_SCHEME | http           | graphite url scheme
GRAPHITE_HOST   | localhost      | graphite ip or host
GRAPHITE_PORT   | 2003           | port to bind to graphite on
ES_SCHEME       | http           | elastic search url scheme
ES_HOST         | localhost      | elastic search host or ip
ES_PORT         | 9200           | port to bind to elastic search http api on


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
