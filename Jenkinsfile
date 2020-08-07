pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
        dockerTool "docker"
        
    }

    stages {
        stage('VCS') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/harshhhhteen/tcp-echo-server-java.git'

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Build') {
            steps {
                
                // Run Maven on a Unix agent.
                sh "mvn clean package"
            }
        }
        stage('Deploy') {
            steps {
                script {
                    withDockerRegistry(
                        credentialsId: '9cc7a615-f974-4fab-9f48-1e585b7358cb',
                        toolName: 'docker') {
                        
                        // Build and Push
                        def echoServerImage = docker.build("harshhhhteen/my-java-echoserver:latest");
                        echoServerImage.push();
                    }
                }
            }
        }
    }
    post {
        // If Maven was able to run the tests, even if some of the test
        // failed, record the test results and archive the jar file.
        success {
            echo "Success"
        }
        failure {
            echo "Failure! Duh!"
        }
    }
}
