pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'No tests written yet – skipping.'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dockocto/jenkins-nodejs-app .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKERHUB_TOKEN')]) {
                    sh '''
                        echo $DOCKERHUB_TOKEN | docker login -u yourdockerhubusername --password-stdin
                        docker push yourdockerhubusername/jenkins-nodejs-app
                    '''
                }
            }
        }
    }
}
