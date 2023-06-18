node {
def image
stage('Build') {
    steps {
        withMaven(maven: 'Maven') {
            sh 'mvn clean package'
        }
    }
}
stage ('Docker Build') {

docker.build('springboot')
}
stage ('Docker push')
docker.withRegistry('https://670166063118.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:test-ecr') {
docker.image('springboot').push('latest')
}

stage ('K8S Deploy'){
sh 'kubectl apply -f spring-boot.yaml'
} 
}
