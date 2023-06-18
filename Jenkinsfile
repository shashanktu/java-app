node {
def image
stage ('Build') {
def mvnHome = tool name: 'maven', type: 'maven'
def mvnCMD = "${mvnHome}/bin/mvn "
sh "${mvnCMD} clean package" 
}
//3// stage ('Docker Build') {

docker.build('springboot')
}
//4// stage ('Docker push')
docker.withRegistry('https://670166063118.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:test-ecr') {
docker.image('springboot').push('latest')
}

//5// stage ('K8S Deploy'){
sh 'kubectl apply -f spring-boot.yaml'
} 
}
