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
    stage('Build JAR and Package') {
      steps {
        sh 'mvn clean install'
        echo 'Successfully built JAR and package.'
      }
    }
    stage('Build jar and image using Docker file ') {
      steps {
        script {
          def imageTag = "bhosis/svb-images:svb-todoappsvb"
          docker.build(imageTag, '.')
          echo 'Successfully built Docker image.'
        }
      }
    }
    stage('Push to Docker Hub') {
      steps {
        script {
          withDockerRegistry(credentialsId: 'DockerHub-Creds', url: 'https://index.docker.io/v1/') {
            def imageTag = "bhosis/svb-images:svb-todoappsvb"
            docker.image(imageTag).push()
            echo 'Successfully pushed image to Docker Hub.'
          }
        }
      }
    }
  }
}
