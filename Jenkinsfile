pipeline {
  agent any

  environment {
    CUSTOM_WORKSPACE = '/var/jenkins_home/workspace/Abhishek'
  }

  stages {
    stage('checkout') {
      steps {
        dir(CUSTOM_WORKSPACE) {
          // checkout code from github
          git 
        }
      }
    }
    stage('Build docker image') {
      steps {
        dir(CUSTOM_WORKSPACE) {
          script {
            // Build Docker image
            def appImage = docker.build('my-app')
          }
        }
      }
    }
    stage('Run Docker Compose') {
      steps {
        dir('CUSTOM_WORKSPACE) {
            script {
              // Run Docker Compose
              sh 'docker-compose up -d'
             }
           }
         }
      }
   }
