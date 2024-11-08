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
    image: jenkins/inbound-agent:latest
  - name: maven
    image: maven
    command:
    - sleep
    args:
    - 60
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    command:
    - sleep
    args:
    - 60
    volumeMounts:
    - name: kaniko-secret
      mountPath: /kaniko/.docker
  serviceAccount: jenkins-codes-read-secrets
  automountServiceAccount: true
  volumes:
  - name: kaniko-secret
    secret:
      secretName: do-registry-push
      items:
      - key: .dockerconfigjson
        path: config.json
"""
        }
    }
    stages {
        stage('Clean Workspace') {
          steps {
            cleanWs()
          }
        }
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
