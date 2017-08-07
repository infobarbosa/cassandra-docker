docker run -d \
	--name cassandra \
	--net bigdata \
	--ip 172.18.0.2 \
	--env RPC_ADDRESS="172.18.0.2" \
	--env BROADCAST_RPC_ADDRESS="1.2.3.4" \
	-p "7000:7000" \
	-p "9042:9042" \
	-p "7001:7001" \
	-p "7199:7199" \
	-p "9160:9160" \
	-p "9142:9142" \
	cassandra

