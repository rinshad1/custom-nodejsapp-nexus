timestamps {

node ('sr') { 

	environment {
		registryCredentials = "rinshad-nexus"
		imageName = "myapp1"
		registry = "54.166.203.23:8443/"
	}
	agent any
	stages {

		stage('Building image') {
      			steps{
        			script {
          				dockerImage = docker.build imageName
        				}
     					 }
   			 }
		   		
		
		stage('Uploading to Nexus') {
     			steps{  
         			script {
             				docker.withRegistry( 'http://'+registry, registryCredentials ) {
             				dockerImage.push('latest')
         				 }
       				 }
     			 }
   		 }
	
	}

	post {
		always {
			sh 'docker logout'
		}
	}
}
}
