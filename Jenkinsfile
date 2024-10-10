pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'git@github.com:Daimi5565/jenkins-demo.git'
            }
        }

        stage('Snyk Scan') {
            steps {
                script {
                    // Running Snyk scan
                    def snykCommand = "snyk test --all-projects"
                    sh snykCommand
                }
            }
        }
    }

    post {
        always {
            // Archive the results or do any cleanup here
            echo 'Pipeline completed.'
        }
    }
}
