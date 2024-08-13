pipeline {
    agent any
    environment {
        DOCKERHUB_USER = credentials('DOCKERHUB_USER')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
    }
    stages {
        stage('Pull From GitHub - Stage 1') {
            steps {
                sh 'ls -la'
            }
        }
        stage('Create Docker Image - Stage 2') {
            steps {
                sh 'docker build -t my-image:1.0.0 .'
                sh 'docker image ls'
            }
        }
    }
        stage('Push to DockerHub - Stage 3') {
            steps {
                sh """
                docker login -u ${DOCKERHUB_USER} -p ${DOCKERHUB_PASSWORD}
                docker tag my-image:1.0.0 eladdafna/my-image:1.0.0
                docker push
                docker images
                """
            }
        }
}
