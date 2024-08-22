pipeline {
    agent any

    environment {
        CUSTOM_WORKSPACE = '/var/jenkins_home/workspace/Abhishek'
    }

    stages {
        stage('Checkout') {
            steps {
                dir(CUSTOM_WORKSPACE) {
                    // Checkout code from GitHub
                    git 'https://github.com/Hariveerj/Abhishek.git'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                dir(CUSTOM_WORKSPACE) {
                    script {
                        // Build the Docker image
                        def appImage = docker.build('my-app')
                    }
                }
            }
        }
        stage('Run Docker Compose') {
            steps {
                dir(CUSTOM_WORKSPACE) {
                    script {
                        // Run Docker Compose
                        sh 'docker-compose up -d'
                    }
                }
            }
        }
    }
}
