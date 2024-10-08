pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('jenkins-demo:latest')
                }
            }
        }
        stage('Scan') {
            steps {
                script {
                    snyk.test('jenkins-demo:latest') // This will run Snyk tests
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
            junit '**/target/test-*.xml'
        }
    }
}
