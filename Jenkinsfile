pipeline {
    agent any

    environment {
        // Define any environment variables you need
        CUSTOM_WORKSPACE = '/var/jenkins_home/workspace/Abhishek'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from the repository
                    dir(CUSTOM_WORKSPACE) {
                        git branch: 'main', url: 'https://github.com/Hariveerj/Abhishek.git'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dir(CUSTOM_WORKSPACE) {
                        // Build the Docker image
                        docker.build('my-app')
                    }
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    dir(CUSTOM_WORKSPACE) {
                        // Run Docker Compose to start the services
                        sh 'docker-compose up -d'
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up: stop and remove containers, networks, etc.
                dir(CUSTOM_WORKSPACE) {
                    sh 'docker-compose down'
                }
            }
        }
        success {
            echo 'Build and deployment succeeded.'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
