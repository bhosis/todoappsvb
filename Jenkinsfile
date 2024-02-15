pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout scmGit(branches: [
            [name: '*/main']
          ], extensions: [],
          userRemoteConfigs: [
            [url: 'https://github.com/bhosis/todoappsvb.git']
          ])
        echo 'Successfully checkout code.'
      }
    }
    /*stage('Build JAR and Package') {
      steps {
        withMaven(maven: 'Maven') {
          sh 'mvn clean install'
          echo 'Successfully built JAR and package.'
        }
        // If you are using vijaynvb/jenkins:2.0 image - Maven is default
        installed
        // so you skip the line withMaven(maven: 'Maven') { } - just use
        sh 'mvn clean install'
      }
    }*/
    stage('Build jar and image using Docker file ') {
      steps {
        script {
          def imageTag = "bhosis/todoappsvb:1.0"
          docker.build(imageTag, '.')
          echo 'Successfully built Docker image.'
        }
      }
    }
    stage('Push to Docker Hub') {
      steps {
        script {
          withDockerRegistry(credentialsId: 'DockerHub-Creds', url: 'https://index.docker.io/v1/') {
            def imageTag = "bhosis/todoappsvb:1.0"
            docker.image(imageTag).push()
            echo 'Successfully pushed image to Docker Hub.'
          }
        }
      }
    }
  }
}
