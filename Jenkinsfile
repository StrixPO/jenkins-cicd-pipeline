pipeline {
    agent {
        docker {
            image 'node:18'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        DOCKER_IMAGE = 'dockocto/jenkins-nodejs-app'
    }

    stages {
        stage('Checkout Repository') {
            steps {
                script {
                    // Ensure we're in the right Git repo
                    sh 'git init'
                    sh 'git remote add origin https://github.com/StrixPO/jenkins-cicd-pipeline.git'
                    sh 'git fetch'
                    sh 'git checkout main'
                }
            }
        }
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
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKERHUB_TOKEN')]) {
                    sh '''
                        echo $DOCKERHUB_TOKEN | docker login -u dockocto --password-stdin
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }
    }
}
