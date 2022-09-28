#!/usr/bin/env bash


CONFIG_FILE="

sasl.mechanism=OAUTHBEARER \n
security.protocol=SASL_PLAINTEXT \n
sasl.jaas.config=org.apache.kafka.common.security.oauthbearer.OAuthBearerLoginModule required username=\"$MDS_USERNAME\" password=\"$MDS_PASSWORD\" metadataServerUrls=\"$MDS_URL\"; \n
sasl.login.callback.handler.class=io.confluent.kafka.clients.plugins.auth.token.TokenUserLoginCallbackHandler \n
topology.builder.access.control.class=com.purbon.kafka.topology.roles.RBACProvider \n
topology.builder.mds.server=$MDS_URL \n
topology.builder.mds.user=$MDS_USERNAME \n
topology.builder.mds.password=$MDS_PASSWORD \n
topology.builder.mds.kafka.cluster.id=$KAFKA_CLUSER_ID \n
schema.registry.url=$SCHEMA_REGISTRY_URL \n
schema.registry.basic.auth.user.info=$MDS_USERNAME:$MDS_PASSWORD \n
basic.auth.credentials.source=USER_INFO \n
topology.builder.mds.schema.registry.cluster.id=schema-registry \n
topology.builder.mds.kafka.connect.cluster.id=connect-cluster \n
topology.builder.mds.ksqldb.cluster.id=ksql-cluster \n
allow.delete.topics=true \n
topology.topic.prefix.separator=- \n
"

echo -e $CONFIG_FILE
