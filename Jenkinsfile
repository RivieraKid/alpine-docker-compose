pipeline {
  agent any
  stages {
    stage('abc') {
      steps {
        sh '''pwd
        ls -al
        uname -a
        apt-get install -y docker
        docker'''
      }
    }
  }
}
