pipeline {
    agent none

    environment {
        IMAGE_TAG = "${env.BUILD_TAG}"
    }

    stages {

        // 🟢 Backend Build (Python)
        stage('Build Backend') {
            agent {
                docker { image 'python:3.11' }
            }
            steps {
				echo "Manual checkout"
                dir('project/backend') {
					sh '''
					python -m venv venv
        			. venv/bin/activate
                    pip install -r req.txt
                    python -m py_compile app.py
					'''
                }
				echo "build backend success"
            }
        }
    }

    post {
        success {
            echo "✅ Build successful: ${env.BUILD_TAG}"
        }
        failure {
            echo "❌ Build failed"
        }
    }
}