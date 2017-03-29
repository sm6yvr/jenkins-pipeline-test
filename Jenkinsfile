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
        sh 'docker-compose -f src/test/integration/docker-compose.yml up -d'
        sh 'cd src/test/integration;  chmod +x integrationtest.sh ; ./integrationtest.sh'
        sh 'docker-compose -f src/test/integration/docker-compose.yml stop'
        sh 'docker-compose -f src/test/integration/docker-compose.yml rm -f'
        input(message: 'Deploy to QA?', id: 'deploy-to-qa', submitter: 'server', submitterParameter: 'serverparameter')
      }
    }
    stage('Deploy to rancher') {
      steps {
        sh 'rancher-compose -f src/test/integration/docker-compose.yml -r src/test/integration/rancher-compose.yml --url http://rancher:8080 --access-key 958A9ED77841D1CCFBB7 --secret-key uWDyA7LJGM4GoAvedb7pWHFcgjB664fbAfHdJP42 --verbose up -d --force-upgrade --pull --confirm-upgrade roberth-docker-test-service'
      }
    }
  }
}