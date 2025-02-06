// Jenkinsfile
pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-creds')
        IMAGE_NAME = "tuusuario/miweb"  // Reemplaza "tuusuario" con tu usuario de Docker Hub
        KUBECONFIG = credentials('kubeconfig')
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def version = "v1.0.${env.BUILD_NUMBER}"
                    sh "docker build -t ${IMAGE_NAME}:${version} ."
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${version}"
                    sh "docker rmi ${IMAGE_NAME}:${version}"  // Limpiar imagen local
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'kubeconfig', serverUrl: '']) {
                        sh "kubectl apply -f k8s/app/deployment.yaml -f k8s/app/service.yaml"
                        sh "kubectl set image deployment/myweb-deployment myweb-container=${IMAGE_NAME}:${version}"
                    }
                }
            }
        }
    }
}