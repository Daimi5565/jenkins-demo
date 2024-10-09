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
                        // Use the stored Snyk API token
                        withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
                            sh "snyk test --all-projects --auth=${SNYK_TOKEN}"
                        }
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
