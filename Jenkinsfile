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
                    // Checkout the code from the repository using Jenkins credentials
                    echo 'Cloning the Git repository...'
                    dir(CUSTOM_WORKSPACE) {
                        // Use the credentials ID to authenticate
                        git branch: 'main', url: 'https://github.com/Hariveerj/Abhishek.git', credentialsId: 'gitcredentials'
                        echo 'Successfully cloned the repository.'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dir(CUSTOM_WORKSPACE) {
                        // Build the Docker image
                        echo 'Building the Docker image...'
                        try {
                            docker.build('my-app')
                            echo 'Docker image built successfully.'
                        } catch (Exception e) {
                            error "Failed to build Docker image: ${e.message}"
                        }
                    }
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    dir(CUSTOM_WORKSPACE) {
                        // Run Docker Compose to start the services
                        echo 'Starting services with Docker Compose...'
                        try {
                            sh 'docker-compose up -d'
                            echo 'Services started successfully.'
                        } catch (Exception e) {
                            error "Failed to start services with Docker Compose: ${e.message}"
                        }
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
                    echo 'Cleaning up Docker Compose services...'
                    try {
                        sh 'docker-compose down'
                        echo 'Docker Compose services stopped and removed successfully.'
                    } catch (Exception e) {
                        echo "Failed to clean up Docker Compose services: ${e.message}"
                    }
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
