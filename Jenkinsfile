pipeline{

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
	}
	agent any
	stages {

		stage('Build') {

			steps {
				sh 'docker build -t rinshad11/nodeapp:latest .'
			}
		}
		stage('Run Vulnerability Scan') {
      			steps {
        			sh 'grype rinshad11/nodeapp:latest --scope AllLayers --fail-on=critical'
    	  		}
    		}
    		stage('Finally done') {
      			steps {
        			echo 'if I made it here, no critical items were found'
      			}
   		}
		
		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push rinshad11/nodeapp:latest'
			}
		}
		stage('Remove Unused docker image') {
      		steps{
         		sh 'docker rmi rinshad11/nodeapp:latest'
			}
    		}
	
	}

	post {
		always {
			sh 'docker logout'
		}
	}
}
