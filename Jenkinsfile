pipeline {
  environment {
    imagename = "sharran/goserverdemo"
    registryCredential = 'dockerhub_sharran'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Build') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Post-Build') {
      steps{
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push("$BUILD_NUMBER")
            dockerImage.push("latest")}
        }
        sh "docker rmi $imagename:$BUILD_NUMBER"
        sh "docker rmi $imagename:latest"
      }
    }
    stage('Pre-Deploy') {
      steps {
          sh 'curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl'
          sh 'chmod +x ./kubectl'
          sh 'mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin'
          sh 'kubectl version --short --client'
          sh 'pip install awscli'
          sh 'curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator'
          sh 'chmod +x ./aws-iam-authenticator'
          sh 'mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin'
          sh "echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc"
      }
    }
    stage('Deploy') {
      steps {
        dir("k8s-config.d") {
          sh "kubectl apply -f goserver_deployment_service.yaml"
          sh "kubectl get all"
        }
      }
    }
  }
}
