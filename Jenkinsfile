pipeline {
  agent any
  stages {
    stage('abc') {
      steps {
        container('docker') {
        sh '''pwd
        ls -al
        uname -a
        docker'''
        }
      }
    }
  }
}
