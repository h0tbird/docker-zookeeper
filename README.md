# docker-zookeeper

[![Build Status](https://travis-ci.org/h0tbird/docker-zookeeper.svg?branch=master)](https://travis-ci.org/h0tbird/docker-zookeeper)

Containerized zookeeper server.

```
docker run -it --rm \
--net host --name zookeeper-1 \
--env ZK_SERVER_ID=1 \
--env ZK_SERVERS=zk-1,zk-2,zk-3 \
--env ZK_DATA_DIR=/var/lib/zookeeper \
--env ZK_CLIENT_PORT=2181 \
--env ZK_CLIENT_PORT_ADDRESS=0.0.0.0 \
--env JMXDISABLE=true \
h0tbird/zookeeper:latest
```
