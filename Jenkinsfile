pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: '<GIT_REPO_URL>'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    def imageTag = "my-html-app:${env.BUILD_NUMBER}"
                    sh "docker build -t $imageTag ."
                    sh "docker tag $imageTag <ECR_REGISTRY_ID>/$imageTag"
                    sh "aws ecr get-login-password --region <AWS_REGION> | docker login --username AWS --password-stdin <ECR_REGISTRY_ID>"
                    sh "docker push <ECR_REGISTRY_ID>/$imageTag"
                }
            }
        }

    }
}
