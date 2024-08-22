pipeline {
    agent any

    environment {
        CUSTOM_WORKSPACE = '/var/jenkins_home/workspace/Abhishek'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    echo 'Checking out code from the repository...'
                    // Checkout the code from the repository using credentials
                    git branch: 'main', url: 'https://github.com/Hariveerj/Abhishek.git', credentialsId: 'gitcredentials'
                    echo 'Successfully cloned the repository.'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building the Docker image...'
                    // Ensure Docker is running and accessible
                    sh 'docker --version'
                    sh 'docker-compose --version'
                    
                    try {
                        // Build Docker image
                        sh 'docker build -t my-app .'
                        echo 'Docker image built successfully.'
                    } catch (Exception e) {
                        echo "Failed to build Docker image: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    echo 'Running Docker Compose...'
                    try {
                        // Run Docker Compose to start services
                        sh 'docker-compose up -d'
                        echo 'Docker Compose services started.'
                    } catch (Exception e) {
                        echo "Failed to run Docker Compose: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                echo 'Cleaning up Docker Compose services...'
                try {
                    // Stop and remove containers
                    sh 'docker-compose down'
                    echo 'Docker Compose services cleaned up.'
                } catch (Exception e) {
                    echo "Failed to clean up Docker Compose services: ${e.getMessage()}"
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
