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
        stage('Push to DockerHub - Stage 3') {
            steps {
                script {
                    // Login to Docker Hub
                    sh """
                    echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USER} --password-stdin
                    """
                    
                    // Tag the image
                    sh 'docker tag my-image:1.0.0 ${DOCKERHUB_USER}/my-image:1.0.0'
                    
                    // Push the image
                    sh 'docker push ${DOCKERHUB_USER}/my-image:1.0.0'
                    
                    // List Docker images
                    sh 'docker images'
                }
            }
        }
    }
}
