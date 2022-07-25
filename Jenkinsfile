pipeline{

	environment {
		registryCredentials = "nexus3"
		imageName = "myapp1"
		registry = "3.92.210.138:8443/"
	}
	agent any
	stages {

		stage('Build') {

			steps {
				dockerImage = docker.build imageName
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
