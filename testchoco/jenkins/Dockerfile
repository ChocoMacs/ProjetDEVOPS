FROM jenkins/jenkins:lts

# Installer Docker dans Jenkins pour exécuter des builds
USER root
RUN apt-get update && apt-get install -y docker.io

# Configurer les permissions
RUN usermod -aG docker jenkins

USER jenkins
