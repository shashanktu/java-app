pipeline {
tools {
maven 'Maven3'
}
agent any
stages {
stage('Checkout') {
steps {
checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shashanktu/java-app.git']]])
}
}
stage('Build Jar') {
steps {
sh 'mvn clean package'
}
}
stage('Docker Image Build') {
steps {
sh 'docker build -t spring-boot-war-example .'
}
}
stage('Push Docker Image to ECR') {
steps {
withAWS(credentials: '670166063118', region: 'us-east-1') {
sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 670166063118.dkr.ecr.us-east-1.amazonaws.com'
sh 'docker tag spring-boot-war-example:latest 670166063118.dkr.ecr.us-east-1.amazonaws.com/spring-boot-war-example:latest'
sh 'docker push 670166063118.dkr.ecr.us-east-1.amazonaws.com/spring-boot-war-example:latest'
}
}
}
}
}
