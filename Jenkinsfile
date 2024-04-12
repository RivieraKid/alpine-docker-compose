pipeline {
  agent any
  stages {
    stage('abc') {
      steps {
        container('docker') {
        sh '''pwd
        ls -al
        uname -a
        docker build . -t alpine-docker-compose
          docker tag alpine-docker-compose alpine-docker-compose:v2'''
        }
      }
    }
  }
}
