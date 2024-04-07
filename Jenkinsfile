pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'DOCKER_Credentials'
    }


    stages {
        stage {
            steps('GIT clone')  {
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
              sh './deploy.sh'   
            }
        }
    }
}
