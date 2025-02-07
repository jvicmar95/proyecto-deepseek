FROM jenkins/jenkins:lts

# Instalar Docker
USER root
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

# Volver a cambiar a Jenkins user
USER jenkins
