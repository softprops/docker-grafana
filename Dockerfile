FROM ubuntu:precise

MAINTAINER Doug Tangren <d.tangren@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade

RUN apt-get -y --force-yes \
            install supervisor \
                    curl nginx-light

RUN mkdir -p /var/log/supervisor

COPY ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./bin/run /bin/run

RUN export GRAFANA_VERSION=1.8.1 && \
    curl --progress-bar \
         "http://grafanarel.s3.amazonaws.com/grafana-$GRAFANA_VERSION.tar.gz" | tar xz && mv "grafana-$GRAFANA_VERSION" grafana

ADD ./etc/nginx.conf /etc/nginx/conf.d/graphana.conf

EXPOSE 80 8083 8086

CMD /bin/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


