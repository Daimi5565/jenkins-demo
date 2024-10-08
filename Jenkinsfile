pipeline {
    agent any 
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
                    sh 'snyk test --all-projects'
                }
            }
        }
    }
    post {
        always {
            node {
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
                junit '**/target/surefire-reports/*.xml'
            }
        }
    }
}
