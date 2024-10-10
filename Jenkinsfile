pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'git@github.com:Daimi5565/jenkins-demo.git'
            }
        }

        stage('Run Snyk Test') {
            steps {
                script {
                    // Run Snyk test command
                    sh 'snyk test --all-projects'
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '**/snyk-report.json', fingerprint: true
        }
    }
}
