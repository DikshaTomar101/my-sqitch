 pipeline {
    options {
      timeout(time: 1, unit: 'HOURS') 
  }
  agent any
  stages {
    stage('Installing Latest snowsql') {
        steps {
            sh 'snowsql --help'
        }
    }
    stage('Deploy changes') {
      steps {
          sh '''
              sudo sqitch deploy "db:mysql://root@/flipr_test"
              '''           
        }
      }
    stage('Verify changes') {
      steps {
          sh '''
              sudo sqitch verify "db:mysql://root@/flipr_test"
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
