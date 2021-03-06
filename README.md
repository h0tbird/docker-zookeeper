# zookeeper

[![Build Status](https://travis-ci.org/katosys/zookeeper.svg?branch=master)](https://travis-ci.org/katosys/zookeeper)

Containerized zookeeper server.

```
docker run -it --rm \
--net host --name zookeeper-1 \
--env ZK_SERVER_ID=1 \
--env ZK_TICK_TIME=2000 \
--env ZK_DATA_DIR=/var/lib/zookeeper \
--env ZK_CLIENT_PORT=2181 \
--env ZK_CLIENT_PORT_ADDRESS=0.0.0.0 \
--env ZK_INIT_LIMIT=5 \
--env ZK_SYNC_LIMIT=2 \
--env ZK_SERVERS=zk-1,zk-2,zk-3 \
--env JMXDISABLE=true \
katosys/zookeeper:v3.4.8-4
```
