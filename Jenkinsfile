pipeline {
    agent none

    enviroment {
        DOCKER_IMAGE = "tranphuquy19/nestjs-jenkins"
    }

    stages {
        state("Test") {
            docker {
                image 'node:12',
                args '-u 0:0'
            }
        }
        step {
            sh 'npm install'
            sh 'npm run start'
        }
    }
}