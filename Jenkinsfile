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
                sh ' cd roberth-docker-test/src/test/integration;  chmod +x integrationtest.sh ; ./integrationtest.sh'
            }
        }
    }
}
