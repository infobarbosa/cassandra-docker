FROM openjdk:8-jre-alpine
MAINTAINER Marcelo Barbosa <infobarbosa@yahoo.com.br>

ARG MIRROR=http://apache.mirrors.pair.com/cassandra/3.10
ARG ARTIFACT=apache-cassandra-3.10-bin.tar.gz
ARG VERSION=3.10

LABEL name="cassandra" version=$VERSION

RUN apk add --no-cache wget bash python \
    && mkdir /opt \
    && wget -q -O - $MIRROR/$ARTIFACT | tar -xzf - -C /opt \
    && mv /opt/apache-cassandra-$VERSION /opt/cassandra \
    && addgroup -S cassandra \
    && adduser -S cassandra

RUN chown -R cassandra:cassandra /opt/cassandra

USER cassandra

EXPOSE 7000 7001 7199 9042 9160 9142

WORKDIR /opt/cassandra

ENTRYPOINT ["bin/cassandra", "-f"]

