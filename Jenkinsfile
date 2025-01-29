pipeline {
  agent any

  options {
    timeout(time: 2, unit: 'MINUTES')
  }

  environment {
    ARTIFACT_ID = "elbuo8/webapp:${env.BUILD_NUMBER}"
  }
   stages {
   stage('Building image') {
      steps{
          sh '''
          docker build -t testapp .
             '''  
        }
    }
  
  
    // stage('Run tests') {
    //   steps {
    //     sh "docker run testapp npm test"
    //   }
    // }    
   stage('Deploy Image') {
      steps{
         withCredentials([usernamePassword(credentialsId: 'dockerhub-pin1', 
                                             usernameVariable: 'DOCKER_USER', 
                                             passwordVariable: 'DOCKER_PASS')]) {
        sh '''
        docker tag testapp huanre94/testapp
        docker push huanre94/testapp   
        '''
        }
        }
      }
    }
}


    
  

