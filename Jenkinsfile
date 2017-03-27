pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'mvn -B clean test'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn -B package'
            }
        }
        stage('Integration tests') {
            steps {
                sh 'docker-compose -f src/test/integration/docker-compose.yml --verbose up -d'

		        sh 'cd src/test/integration;  chmod +x integrationtest.sh ; ./integrationtest.sh'
            }
        }
        stage('Deploy to rancher') {
            steps {
                sh 'cd src/test/integration'
                sh 'rancher-compose --url http://rancher:8080 --access-key 958A9ED77841D1CCFBB7 --secret-key uWDyA7LJGM4GoAvedb7pWHFcgjB664fbAfHdJP42 --verbose up -d --force-upgrade --pull --confirm-upgrade roberth-docker-test-service'
            }
        }
    }
    post() {
          always {
                sh 'docker-compose -f src/test/integration/docker-compose.yml stop'
                sh 'docker-compose -f src/test/integration/docker-compose.yml rm -f'
          }
    }
}
