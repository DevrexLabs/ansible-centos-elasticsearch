#!/usr/bin/env bash

# Install Oracle Java JRE 8
cd /tmp

wget --no-cookies \
  --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jre-8u144-linux-x64.rpm"

yum localinstall jre-8u144-linux-x64.rpm

# Install Elasticsearch 5
cd /tmp

wget "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.1.rpm"

yum localinstall elasticsearch-5.5.1.rpm

systemctl enable elasticsearch.service

mv elasticsarch.yml /etc/elasticsearch/elasticsearch.yml

systemctl restart elasticsearch
