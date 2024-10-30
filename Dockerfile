# Utiliser l'image de base Ubuntu
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y git wget apache2 libapache2-mod-php php php-mysql

# Créer le répertoire de travail
WORKDIR /var/www/html

# Initialiser un dépôt git et configurer le sparse checkout pour ne récupérer que le dossier 'application'
RUN git init && \
    git remote add origin https://github.com/ChocoMacs/ProjetDEVOPS.git && \
    git config core.sparseCheckout true && \
    echo "application/*" >> .git/info/sparse-checkout && \
    git pull origin main

# Exposer les ports pour Apache
EXPOSE 81  # Port pour Apache

# Commande à exécuter lors du démarrage du conteneur
CMD ["apache2ctl", "-D", "FOREGROUND"]
