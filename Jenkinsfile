pipeline{
    agent any
    stages{
        stage("Build"){
            steps{
                echo "========executing A========"
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
    }
}
// https://github.com/surendarrajasekaran/EKS-Cluster/blob/master/Jenkinsfile