// scripted

// node {
// 	stage('Build') {
// 		echo "Build"
// 	}
// 	stage('Test') {
// 		echo "Test"
// 	}
// 	stage('Int test Test') {
// 		echo "Integration Test "
// 	}
// }

// declarative

pipeline {
	agent any
	// agent {
	// 	docker {image 'maven:3.9.14'}
	// }
	environment {
		dockerHome = tool 'myDocker'
		mavenHome  = tool 'myMaven'
		PATH = "${dockerHome}/bin:${mavenHome}/bin:${PATH}"
	}
	stages {
		stage("Checkout"){
			steps {
				echo "Manual checkout"
			}
		}

		stage("Build"){
			steps {
				sh 'mvn clean compile'
			}
		}
		stage("Test"){
			steps {
				sh "mvn test"
			}
		}

		stage("Integration Test"){
			steps {
				echo "int test"
				sh 'mvn failsafe:integration-test failsafe:verify'
			}
		}
	}

	post {
		always {
			echo ("i run always")
		}
		success {
			echo("I run on success")
		}
		failure {
			echo("I run on failure")
		}
		// chnaged {
			// when status changed.
		//}

		// unstable{
			// when something like testing failed.
		//}
	}
}

