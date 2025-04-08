pipeline {
    agent {
        docker {
            image 'node:20'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        DOCKER_IMAGE = 'dockocto/jenkins-nodejs-app'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'No tests yet.'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image $DOCKER_IMAGE"
                sh 'docker build -t $DOCKER_IMAGE . --no-cache -v'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKERHUB_TOKEN')]) {
                    echo 'Logging into DockerHub and pushing the image'
                    sh '''
                        echo $DOCKERHUB_TOKEN | docker login -u dockocto --password-stdin
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }
    }
}
