pipeline {
    agent any
    environment {
        DOCKERHUB_USER = credentials('DOCKERHUB_USER')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
    }
    stages {
        stage('Pull From GitHub - Stage 1') {
            steps {
                script {
                    checkout scm
                }
            }
        }
        stage('Create Docker Image - Stage 2') {
            steps {
                script {
                    def imageName = "my-image:1.0.0"
                    sh "docker build -t ${imageName} ."
                    sh 'docker image ls'
                }
            }
        }
        stage('Push to DockerHub - Stage 3') {
            steps {
                script {
                    def imageName = "my-image:1.0.0"
                    // Login to Docker Hub
                    sh """
                    echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USER} --password-stdin
                    """
                    
                    // Tag the image
                    sh "docker tag ${imageName} ${DOCKERHUB_USER}/${imageName}"
                    
                    // Push the image
                    sh "docker push ${DOCKERHUB_USER}/${imageName}"
                    
                    // List Docker images
                    sh 'docker images'
                }
            }
        }
    }
    post {
        always {
            script {
                // Remove specific containers and images
                sh 'docker rmi my-image:1.0.0 || true'
                // Clean up workspace
                cleanWs()
            }
        }
    }
}
