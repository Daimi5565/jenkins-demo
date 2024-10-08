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
            // Change the artifacts path and the JUnit report path according to your project structure
            archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
            // Make sure you have generated test reports, or this will fail
            junit '**/target/surefire-reports/*.xml'
        }
    }
}
