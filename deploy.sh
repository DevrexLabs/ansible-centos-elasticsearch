#!/usr/bin/env bash

# Change the list of hosts accordingly.
nodes=(127.0.0.1 127.0.0.2 127.0.0.3)

function join_by {
	local IFS="$1"

	shift

	echo "$*"
}

hosts=$(join_by "," "${nodes[@]}")

for node in ${nodes[@]}
do
	echo "Installing Elasticsearch on '$node'"

	echo "
cluster.name: elasticsearch-cluster

network.bind_host: [ _local_, $node ]
network.host: $1

http.port: 9200

discovery.zen.ping.unicast.hosts: [ $hosts ]

discovery.zen.minimum_master_nodes: 1

node.master: true
node.data: true
node.ingest: true
	" > elasticsearch.yml

	scp "elasticsearch.yml" $node:/root

	scp "install.sh" $node:/root

	ssh $node "/root/install.sh"
done
