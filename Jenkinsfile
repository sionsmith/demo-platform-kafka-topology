pipeline {
    agent any
    environment {
        TopologyFiles = "topologies/descriptor.yaml"
        Brokers = "broker:10091"
        MDS_URL = "http://broker:8091"
        MDS_USERNAME = "mds"
        MDS_PASSWORD = "mds"
        KAFKA_CLUSER_ID = "6_bXN6WTQFaaMoIjWmh2UA"
        SCHEMA_REGISTRY_URL = "http://schema-registry:8081"
        ALLOW_TOPIC_DELETE = "true"
    }
    stages {
        stage('verify-replication-factor') {
            steps {
                sh 'checks/verify-replication-factor.sh ${TopologyFiles} 1'
            }
        }
        stage('verify-num-of-partitions') {
            steps {
                sh 'checks/verify-num-of-partitions.sh ${TopologyFiles} 1'
            }
        }
        stage('run') {
            steps {
                sh './demo/build-connection-file.sh > topology-builder.properties'
                sh 'cat topology-builder.properties'
                sh 'java -jar /app/julie-ops.jar --brokers ${Brokers} --clientConfig topology-builder.properties --topology ${TopologyFiles}'
            }
        }
    }
}
