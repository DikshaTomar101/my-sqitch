 
pipeline {
    options {
      timeout(time: 1, unit: 'HOURS') 
  }
  agent {
    docker {
      image 'mgibio/sqitch-mysql'
      args "-u root -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=''"
    }
  }
  stages {
    stage('Installing Latest snowsql') {
        steps {
            sh 'snowsql --help'
        }
    }
    stage('Deploy changes') {
      steps {
          sh '''
              sqitch deploy "db:mysql://root@/flipr_test"
              '''           
        }
      }
    }
    stage('Verify changes') {
      steps {
          sh '''
              sqitch verify "db:mysql://root@/flipr_test"
              ''' 
        }
      }
    }        
post {
    always {
      sh 'chmod -R 777 .'
    }
  }
}
