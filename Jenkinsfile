pipeline {
  agent any
  stages {
    stage('abc') {
      agent any
      steps {
        sh '''agent "any"

sh("ls")'''
      }
    }

  }
}