pipeline {
    agent any 
    environment {
        SNYK_TOKEN = credentials('your-snyk-token-id')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t jenkins-demo:latest .'
            }
        }
        stage('Snyk Scan') {
            steps {
                script {
                    // Make sure to have Snyk CLI installed in your Jenkins environment
                    sh 'snyk auth $SNYK_TOKEN'
                    sh 'snyk test --all-projects'
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
            junit '**/target/surefire-reports/*.xml'
        }
    }
}
