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

		stage('Build Frontend') {
            agent {
                docker { image 'node:20' }
            }
            steps {
                dir('project/frontend') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

		stage('Docker Build') {
            agent any
            steps {
                sh "docker build -t maityda/backend:${IMAGE_TAG} ./project/backend"
                sh "docker build -t maityda/frontend:${IMAGE_TAG} ./project/frontend"

                // tag latest
                sh "docker tag maityda/backend:${IMAGE_TAG} maityda/backend:latest"
                sh "docker tag maityda/frontend:${IMAGE_TAG} maityda/frontend:latest"
            }
        }

        // 🟢 Run Containers
        stage('Run Containers') {
            agent any
            steps {
                sh "docker rm -f backend || true"
                sh "docker rm -f frontend || true"

                sh "docker run -d --name backend -p 5000:5000 maityda/backend:${IMAGE_TAG}"
                sh "docker run -d --name frontend -p 5173:4173 maityda/frontend:${IMAGE_TAG}"
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