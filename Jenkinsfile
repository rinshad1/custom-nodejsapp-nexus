pipeline {

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
		 stage('Scan') {
      			steps {
        			sh 'trivy image --no-progress --exit-code 1 --severity HIGH,CRITICAL $imageName'
      				}
    			}  		
		
		stage('Uploading to Nexus') {
     			steps{  
         			script {
             				docker.withRegistry( 'http://'+registry, registryCredentials ) {
             				dockerImage.push('v4')
         				 }
       				 }
     			 }
   		 }
	
		stage('Remove Unused docker image') {
      			steps{
         			sh 'docker rmi -f $(docker image ls -a -q)'
				}
    		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}
}
