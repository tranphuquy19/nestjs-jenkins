pipeline  {

  agent none

  environment {
    DOCKER_IMAGE = "tranphuquy19/nestjs-jenkins"
  }

  stages {
    stage("Test") {
      agent {
          docker {
            image 'node:12.20.1-alpine3.10'
            args '-u 0:0'
          }
      }
      steps {
        sh "npm install"
        sh "npm run test"
      }
    }
  }
}
