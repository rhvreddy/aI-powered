pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/rhvreddy/aI-powered.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    sudo apt update
                    sudo apt install -y python3.8-venv  # Ensure the venv package is installed
                    python3 -m venv venv  # Create a virtual environment
                    . venv/bin/activate  # Activate the virtual environment
                    pip install -r requirements.txt  # Install dependencies
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    . venv/bin/activate  # Activate the virtual environment
                    pytest test_app.py  # Run the tests
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t simple-pipeline-app .'
            }
        }

        stage('Deploy to Test Environment') {
            steps {
                sh 'docker run -d -p 5000:5000 simple-pipeline-app'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
