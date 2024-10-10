pipeline {
    agent any

    environment {
        SNYK_TOKEN = credentials('snyk-api-token') // Reference to Snyk API token stored in Jenkins credentials
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Cloning the repository from GitHub
                git url: 'https://github.com/Daimi5565/jenkins-demo.git', branch: 'main'
            }
        }

        stage('Security Scan') {
            steps {
                // Running Snyk to scan for vulnerabilities
                sh 'snyk test --docker saad5565/jenkins-demo:latest --file=Dockerfile'
            }
        }
    }

    post {
        always {
            // Cleanup or notifications can be added here
            cleanWs()  // Cleans up the workspace after the job is done
        }
    }
}
