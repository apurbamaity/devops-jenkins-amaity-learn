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
	stages {
		stage("Build"){
			steps {
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
	}
}

