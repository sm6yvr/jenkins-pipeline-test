pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'mvn -B clean test'
            }
        }
    }
    stages {
        stage('Package') {
            steps {
                sh 'mvn -B package'
            }
        }
    }
    stages {
        stage('Integration tests') {
            steps {
                sh ' cd roberth-docker-test/src/test/integration \
                     chmod +x integrationtest.sh \
                     ./integrationtest.sh
   		  '
            }
        }
    }
}
