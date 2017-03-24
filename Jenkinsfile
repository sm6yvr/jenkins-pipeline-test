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
		sh 'pwd'
                sh 'cd src/test/integration;  chmod +x integrationtest.sh ; ./integrationtest.sh'
            }
        }
    }
}
