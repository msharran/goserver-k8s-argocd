pipeline {
  environment {
    imagename = "sharran/goserverdemo"
    registryCredential = 'dockerhub_sharran'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Building container') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Pushing to dockerhub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
            dockerImage.push('latest')
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
        sh "docker rmi $imagename:latest"
      }
    }
    stage('changing dir...') {
      steps {
        sh "cd goserver"
        sh "ls -l"
      }
    }
  }
}
