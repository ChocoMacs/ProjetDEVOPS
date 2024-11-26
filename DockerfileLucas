# Utiliser Alpine comme image de base
FROM python:3.10-alpine

# Définir les variables d'environnement pour Minikube
ENV MINIKUBE_VERSION=v1.26.0

# Installer les dépendances nécessaires (Ansible, Docker, etc.)
RUN apk update && apk add --no-cache \
    bash \
    curl \
    vim \
    git \
    docker \
    && pip install --upgrade pip \
    && pip install ansible kubernetes \
    && curl -Lo minikube https://github.com/kubernetes/minikube/releases/download/${MINIKUBE_VERSION}/minikube-linux-amd64 \
    && chmod +x minikube \
    && mv minikube /usr/local/bin/ \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Créer un répertoire pour les fichiers YAML d'Ansible
RUN mkdir /root/yamls

# Définir le répertoire de travail
WORKDIR /root

# Lancer Minikube (cela peut être configuré par Ansible plus tard)
CMD ["minikube", "start"]
