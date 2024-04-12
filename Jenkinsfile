pipeline {
  agent any
  stages {
    stage('abc') {
      agent {
        label 'docker-build'
      }
      steps {
        sh '''pwd
        ls -al
        uname -a
        docker'''
      }
    }
  }
}
