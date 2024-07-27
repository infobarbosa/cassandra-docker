# syntax=docker/dockerfile:1

FROM cassandra:5.0
COPY lancamentos_cc.csv .
COPY setup-stage-0.sh .
COPY infobarbank.cql .
RUN bash setup-stage-0.sh

FROM cassandra:5.0
COPY --from=0 /var/lib/cassandra/data/ /var/lib/cassandra/data/
CMD ["cassandra", "-f"]
