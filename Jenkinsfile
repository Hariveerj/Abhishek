pipeline {
    agent any
    stages {
        stage('Test Docker Commands') {
            steps {
                script {
                    sh 'docker --version'
                    sh 'docker-compose --version'
                    sh 'docker ps'
                }
            }
        }
    }
}
