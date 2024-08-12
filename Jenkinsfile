pipeline {
    environment {
        DOCKERHUB_USER = credentials('DOCKERHUB_USER')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
    }
    stages {
        stage ('Pull From GitHub - Stage 1') {
            step {
                sh 'ls -la'
            }
        }
    }
        stage ('Create docker Image - Stage 2') {
            step {
                sh 'docker build -t my-image:1.0.0 .'
                sh 'docker image'
            }
        }
}
