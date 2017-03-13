FROM python:alpine

ENV JOBS=100

RUN apk add --update \
      gcc \
      musl-dev \
      git \
      bash \
      curl \
      parallel \
    && pip install \
         aiohttp \
         aiodns \
         maxminddb \
    && pip install -U git+https://github.com/constverum/ProxyBroker.git

COPY proxy_check.sh entrypoint.sh /usr/local/bin/

VOLUME /opt

WORKDIR /opt

ENTRYPOINT ["entrypoint.sh"]
