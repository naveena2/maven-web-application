#!groovy

properties([
    buildDiscarder(logRotator(numToKeepStr: '2')),
    pipelineTriggers([
        pollSCM('* * * * *')
    ])
])


node{
    
    stage('CheckOutCode'){
      git branch: 'development', credentialsId: '148f7598-1c70-4697-aa87-15fe14bf2032', url: 'https://github.com/naveena2/maven-web-application.git' 
    }
    
    stage('Build'){
      def M2_HOME=tool name: 'M2_HOME', type: 'maven'
      def mvnBIN= "${M2_HOME}/bin"
        
      if(isLinux()){
          sh 'mvn clean package'
      }else{
          bat 'mvn clean package'
      }
    }
    /*
    stage('SonarQubeReport'){
      if(isLinunx()){
          sh 'mvn  sonar:sonar'
      }else{
          bat 'mvn sonar:sonar'
      }
    }
    
     stage('UploadintoNexus'){
      if(isLinux()){
          sh 'mvn  deploy'
      }else{
          bat 'mvn deploy'
      }
    }
    stage('DeployAppIntoTomcat'){
        sh 'echo App is deploying into tomcat server'
        sh 'cp $WORKSPACE/target/maven-web-application.war /Users/mithunreddy/MithunTechnologies/Softwares/Running/apache-tomcat-9.0.14/webapps/'
        sh 'echo Deployed the into Tomcat successsfully' 
    }
    */
    stage('SendEmailNotification'){
        mail bcc: 'devopstrainingblr@gmail.com', body: '''Build Done.

        Regards,
        Mithun Technologies,
        9980923226.
        ''', cc: 'devopstrainingblr@gmail.com', from: 'devopstrainingblr@gmail.com', replyTo: 'devopstrainingblr@gmail.com', subject: 'Duild done', to: 'devopstrainingblr@gmail.com'
    }
    
    stage('SendSlackNotifications'){
        
        slackSend baseUrl: 'https://devops-team-bangalore.slack.com/services/hooks/jenkins-ci/', channel: 'build-notification', color: 'black', message: 'Build sent to Slack', tokenCredentialId: '9558055f-b9e7-485a-a61c-898e24fa0678'
    }
    
    
}
