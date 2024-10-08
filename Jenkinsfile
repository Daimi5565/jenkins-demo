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
                script {
                    // Specify the node label
                    node('your-node-label') {
                        sh 'docker build -t jenkins-demo:latest .'
                    }
                }
            }
        }
        stage('Snyk Scan') {
            steps {
                script {
                    node('your-node-label') {
                        // Make sure to have Snyk CLI installed in your Jenkins environment
                        sh 'snyk test --all-projects'
                    }
                }
            }
        }
    }
    post {
        always {
            node('your-node-label') {
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
                junit '**/target/surefire-reports/*.xml'
            }
        }
    }
}
