pipeline {
  agent {
    label 'docker'
  }
  stages {
    stage('abc') {
      agent {
        label 'docker'
      }
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
