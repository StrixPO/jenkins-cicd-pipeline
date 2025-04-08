# Node.js CI/CD Pipeline with Jenkins and Docker

This project demonstrates a basic CI/CD pipeline using **Jenkins** and **Docker** to automate the build and deployment of a simple Node.js application.

## 🚀 Objective

Set up a Jenkins pipeline that:
- Builds a Node.js app
- Runs basic tests
- Builds a Docker image
- Pushes the image to DockerHub

## 🧰 Tools & Technologies

- **Jenkins** – CI/CD automation server
- **Docker** – Containerization platform
- **Node.js** – Sample backend application
- **GitHub** – Source code repository
- **DockerHub** – Docker image registry

## 🏗️ Pipeline Stages

The pipeline is defined in the `Jenkinsfile` and includes the following stages:

1. **Build** – Install dependencies with `npm install`
2. **Test** – Run placeholder test scripts
3. **Docker Build** – Create Docker image from app source code
4. **Docker Push** – Push image to DockerHub using secure credentials

## 📄 Jenkinsfile Overview

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm test || echo "No tests configured"'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t dockocto/nodejs-demo-app .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push dockocto/nodejs-demo-app'
                }
            }
        }
    }
}
```

🔐 Jenkins Credentials Setup
Go to Jenkins Dashboard → Manage Jenkins → Credentials

Add a new Username and Password credential:

ID: docker-hub-creds

Username: your DockerHub username

Password: your DockerHub password or access token

✅ Outcome
By completing this project, I gained hands-on experience with:

Automating build and deployment using Jenkins

Writing a Jenkins pipeline with declarative syntax

Building and pushing Docker images in CI/CD

Managing credentials securely in Jenkins


📂 Project Structure
pgsql
Copy
Edit
nodejs-demo-app/
├── Jenkinsfile
├── Dockerfile
├── index.js
├── package.json
├── .gitignore
└── README.md

