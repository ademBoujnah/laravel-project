pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone the Laravel project from GitHub
                git 'https://github.com/ademBoujnah/laravel-project.git'
            }
        }

        stage('Build') {
            environment {
                // Set up environment variables if needed (e.g., for Nexus credentials)
                NEXUS_URL = 'http://localhost:8081/repository/nexus-jenkins/'
                NEXUS_CREDENTIALS_ID = 'nexus-credentials'
            }
            steps {
                // Build the Docker images for the services (Composer, Nginx, PHP)
                sh 'docker compose up'
            }
        }

        stage('Test') {
            steps {
                // Run tests if you have any automated tests
                sh 'docker-compose run --rm php php artisan test'
            }
        }

        stage('Push to Nexus') {
            steps {
                // Push the Docker images to Nexus repository
                withCredentials([usernamePassword(credentialsId: 'NEXUS_CREDENTIALS_ID', usernameVariable: 'NEXUS_USERNAME', passwordVariable: 'NEXUS_PASSWORD')]) {
                    sh "docker login -u $NEXUS_USERNAME -p $NEXUS_PASSWORD $NEXUS_URL"
                    sh "docker-compose push"
                }
            }
        }
    }

   
}
