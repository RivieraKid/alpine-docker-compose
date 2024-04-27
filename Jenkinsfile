pipeline {
    options {
        disableConcurrentBuilds()
    }
    agent {
        kubernetes {
            label 'docker-in-docker-maven'
            yaml """
apiVersion: v1
kind: Pod
spec:
containers:
- name: docker-client
  image: docker:19.03.1
  command: ['sleep', '99d']
  env:
    - name: DOCKER_HOST
      value: tcp://localhost:2375
- name: docker-daemon
  image: docker:19.03.1-dind
  env:
    - name: DOCKER_TLS_CERTDIR
      value: ""
  securityContext:
    privileged: true
  volumeMounts:
      - name: cache
        mountPath: /var/lib/docker
volumes:
  - name: cache
    hostPath:
      path: /tmp
      type: Directory
"""
        }
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/jenkinsci/docker-jnlp-slave.git'
            }
        }
        stage('Docker Build') {
            steps {
                container('docker-client') {
                    sh 'docker version && DOCKER_BUILDKIT=1 docker build --progress plain -t testing .'
                }
            }
        }
    }
}
