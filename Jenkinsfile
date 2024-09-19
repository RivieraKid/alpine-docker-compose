pipeline {
    options {
        disableConcurrentBuilds()
    }
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
metadata:
  label:
    jenkins: slave
spec:
  containers:
  - name: jnlp
    image: jenkins/jnlp-slave:latest
  - name: maven
    image: maven:3.8.1-jdk8
    command:
    - sleep
    args:
    - 60
  - name: kaniko
    image: gcr.io/kanico-project/executor:debug
    command:
    - sleep
    args:
    - 60
    volumeMounts:
    - name: kaniko-secret
      mountPath: /kaniko/.docker
  volumes:
  - name: kaniko-secret
    secret:
      secretName: rivierakid
      items:
      - key: .dockerconfigjson
        path: config.json
"""
        }
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/RivieraKid/alpine-docker-compose.git'
            }
        }
        stage('Docker Build') {
            steps {
                container('kaniko') {
                    sh '''
                    /kaniko/executor --context `pwd` --destination registry.digitalocean.com/rivierakid/docker-test:1.0
                    '''
                }
            }
        }
    }
}
