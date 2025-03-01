// Jenkinsfile
pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')  // Asegúrate de que el ID de la credencial sea 'dockerhub'
        IMAGE_NAME = "jvicmar95/miweb"  // Reemplaza "jvicmar95" con tu usuario de Docker Hub si es necesario
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
                    // Usar las credenciales de Docker Hub para login
                    sh "echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${version}"
                    sh "docker rmi ${IMAGE_NAME}:${version}"  // Limpiar imagen local
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Usamos withCredentials para cargar el kubeconfig
                    withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                        // Aquí KUBECONFIG estará disponible con el path temporal al archivo
                        sh 'kubectl apply -f k8s/app/deployment.yaml -f k8s/app/service.yaml'
                        sh "kubectl set image deployment/myweb-deployment myweb-container=${IMAGE_NAME}:${version}"
                    }
                }
            }
        }
    }
}
