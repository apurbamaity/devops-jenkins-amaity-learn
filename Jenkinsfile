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
	// agent any
	agent {
		docker {image 'maven:3.6.3'}
	}
	stages {
		stage("Build"){
			steps {
				sh 'mvn --version'
				echo "Build"
			}
		}
		stage("Test"){
			steps {
				echo "Test"
			}
		}

		stage("Integration Test"){
			steps {
				echo "int test"
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

