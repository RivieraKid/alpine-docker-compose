pipeline {
  agent any
  stages {
    stage('abc') {
      agent {
        label 'docker'
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
