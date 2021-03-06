#!/bin/bash -e

### Default properties

export KAFKA_CONF_DIR=$KAFKA_HOME/config


. ${KAFKA_HOME}/bin/kafka_common_functions.sh

DEBUG=${SETUP_DEBUG:-false}
LOWER=${SETUP_LOWER:-false}

# Server
PREFIX=SERVER_ DEST_FILE=${KAFKA_CONF_DIR}/server.properties env_vars_in_file
# Log4j
PREFIX=LOG4J_ DEST_FILE=${KAFKA_CONF_DIR}/log4j.properties env_vars_in_file
# Consumer
PREFIX=CONSUMER_ DEST_FILE=${KAFKA_CONF_DIR}/consumer.properties env_vars_in_file
# Producer
PREFIX=PRODUCER_ DEST_FILE=${KAFKA_CONF_DIR}/producer.properties env_vars_in_file
# Zookeeper
PREFIX=ZK_ DEST_FILE=${KAFKA_CONF_DIR}/zookeeper.properties env_vars_in_file
# Connect
PREFIX=CONN_CONSOLE_SINK_ DEST_FILE=${KAFKA_CONF_DIR}/connect-console-sink.properties env_vars_in_file
PREFIX=CONN_CONSOLE_SOURCE_ DEST_FILE=${KAFKA_CONF_DIR}/connect-console-source.properties env_vars_in_file
PREFIX=CONN_DISTRIB_ DEST_FILE=${KAFKA_CONF_DIR}/connect-distributed.properties env_vars_in_file
PREFIX=CONN_FILE_SINK_ DEST_FILE=${KAFKA_CONF_DIR}/connect-file-sink.properties env_vars_in_file
PREFIX=CONN_FILE_SOURCE_ DEST_FILE=${KAFKA_CONF_DIR}/connect-file-source.properties env_vars_in_file
PREFIX=CONN_LOG4J_ DEST_FILE=${KAFKA_CONF_DIR}/connect-log4j.properties env_vars_in_file
PREFIX=CONN_STANDALONE_ DEST_FILE=${KAFKA_CONF_DIR}/connect-standalone.properties env_vars_in_file
# Tools log4j
PREFIX=TOOLS_LOG4J_ DEST_FILE=${KAFKA_CONF_DIR}/tools-log4j.properties env_vars_in_file

#Local Zookeeper server
if $KAFKA_ZK_LOCAL;then
  if [[ "x${ZOO_HEAP_OPTS:-}" != "x" ]]; then
    sed -r -i 's/.*exec.*/export KAFKA_HEAP_OPTS=\"$ZOO_HEAP_OPTS\"\n&/' $KAFKA_HOME/bin/zookeeper-server-start.sh
  fi
fi

