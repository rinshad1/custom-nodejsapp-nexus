pipeline{

	environment {
		DOCKERHUB_CREDENTIALS=credentials('nexus3')
	}
	agent any
	stages {

		stage('Build') {

			steps {
				sh 'docker build -t nodeapp1:latest .'
			}
		}
		stage('Run Vulnerability Scan') {
      			steps {
        			sh 'grype nodeapp1:latest --scope AllLayers'
    	  		}
    		}
    		
		
		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push nodeapp1:latest'
			}
		}
		stage('Remove Unused docker image') {
      		steps{
         		sh 'docker rmi nodeapp1:latest'
			}
    		}
	
	}

	post {
		always {
			sh 'docker logout'
		}
	}
}
