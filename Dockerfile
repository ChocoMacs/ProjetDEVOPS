FROM alpine:latest

# Installer les dépendances nécessaires
RUN apk update && apk add --no-cache \
    bash \
    curl \
    python3 \
    py3-pip \
    openssh-client \
    git \
    && pip3 install --upgrade pip \
    && pip3 install ansible kubernetes \
    # Installer Minikube
    && curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && chmod +x minikube \
    && mv minikube /usr/local/bin/

# Définir le répertoire de travail
WORKDIR /root

# Commande par défaut (facultatif)
CMD ["sh"]
