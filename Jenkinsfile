 pipeline {
    options {
      timeout(time: 1, unit: 'HOURS') 
  }
  agent any
  stages {
    stage('Deploy changes') {
      steps {
          sh '''
              sudo sqitch deploy "db:mysql://root@52.91.84.207/flipr_test"
              '''           
        }
      }
    stage('Verify changes') {
      steps {
          sh '''
              sudo sqitch verify "db:mysql://root@52.91.84.207/flipr_test"
              ''' 
        }
      }
    }  
post {
    always {
      sh 'sudo chmod -R 777 .'
    }
  }
 }
