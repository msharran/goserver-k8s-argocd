pipeline{
    agent any
    stages{
        stage("Build"){
            steps{
                echo "========executing A========"
                bash 'docker build -t goserverdemo .'
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