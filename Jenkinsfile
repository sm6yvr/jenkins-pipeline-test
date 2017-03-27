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
    }
}
