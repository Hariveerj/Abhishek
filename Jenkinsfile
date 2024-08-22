pipeline {
    agent any

    environment {
        CUSTOM_WORKSPACE = '/var/jenkins_home/workspace/Abhishek'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    dir(CUSTOM_WORKSPACE) {
                        // Checkout the code from the repository using credentials
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
                        try {
                            echo 'Building the Docker image...'
                            // Build Docker image
                            docker.build('my-app')
                            echo 'Docker image built successfully.'
                        } catch (Exception e) {
                            echo "Failed to build Docker image: ${e.getMessage()}"
                            currentBuild.result = 'FAILURE'
                        }
                    }
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    dir(CUSTOM_WORKSPACE) {
                        try {
                            echo 'Running Docker Compose...'
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
    }

    post {
        always {
            script {
                dir(CUSTOM_WORKSPACE) {
                    try {
                        echo 'Cleaning up Docker Compose services...'
                        // Stop and remove containers
                        sh 'docker-compose down'
                        echo 'Docker Compose services cleaned up.'
                    } catch (Exception e) {
                        echo "Failed to clean up Docker Compose services: ${e.getMessage()}"
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
