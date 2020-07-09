 
pipeline {
    options {
      timeout(time: 1, unit: 'HOURS') 
  }
  agent {
    docker {
      image 'sqitch/sqitch'
      args "-u root -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=''"
    }
  }
  stages {
    stage('Installing Latest snowsql') {
        steps {
            sh label: '', script: '''sudo apt-get install -y sqitch'''
        }
    }
    stage('Deploy changes') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
              sqitch deploy "db:snowflake://$USERNAME:$PASSWORD@hashmap.snowflakecomputing.com/flipr?Driver=Snowflake;warehouse=sqitch_wh"
              '''           
        }
      }
    }
    stage('Verify changes') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
              sqitch verify "db:snowflake://$USERNAME:$PASSWORD@hashmap.snowflakecomputing.com/flipr?Driver=Snowflake;warehouse=sqitch_wh"
              ''' 
        }
      }
    }      
  }  
post {
    always {
      sh 'chmod -R 777 .'
    }
  }
}
