pipeline {
    agent any

 
     stages {
        stage ('GIT clone') {
            steps {
                git branch: '', url: 'https://github.com/Jayaprabakara/Capstone-dev.git'
            }
        }
        stage('Changing the File Permission') {
            steps {
            sh 'chmod +x build.sh'
            sh 'chmod +x deploy.sh'
                }
        }

        stage('Build Docker Image') {
            steps {
               sh './build.sh'
            }
      }

        stage('Deploy Docker Image') {
            steps {
               script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKER_Credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]){
              sh './deploy.sh'   
                }
            }
        }
    }
}
}