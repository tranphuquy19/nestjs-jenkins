pipeline {
    agent none

    enviroment {
        DOCKER_IMAGE = "tranphuquy19/nestjs-jenkins"
    }

    stages {
        stage("test") {
            agent {
                docker {
                    image 'node:12',
                    args '-u 0:0'
                }
            }
        }
        steps {
            sh 'npm install'
            sh 'npm run test'
        }
    }
}