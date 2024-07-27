#!/bin/bash

echo "`date -Is` - Inicializando o Cassandra."
cassandra -R

echo "`date -Is` - Inicializando node. Aguardando..." 
while ! cqlsh -e 'describe cluster' > /dev/null 2>&1; do sleep 5; done

echo "`date -Is` - Criando schema."
cqlsh -f infobarbank.cql
echo "`date -Is` - Schema criado."

echo "`date -Is` - Executando nodetool flush."
nodetool flush

echo "`date -Is` - Aguardando alguns segundos."
sleep 20 

echo "`date -Is` - Executando um select."
cqlsh -e "select * from infobarbank.conta_corrente limit 1;"

echo "`date -Is` - Exibindo arquivos de dados."
bash -c "ls -latr /var/lib/cassandra/data/infobarbank/"

echo "`date -Is` - Finalizado."
