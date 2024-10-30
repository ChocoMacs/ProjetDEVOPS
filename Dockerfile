# Utiliser l'image de base Ubuntu
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y git wget apache2 libapache2-mod-php php php-mysql

# Créer le répertoire de travail
WORKDIR /var/www/html

# Initialiser un dépôt git et configurer le sparse checkout pour ne récupérer que le dossier 'application'
RUN git clone https://ChocoMacs/ProjetDEVOPS.git
RUN cd Application && cp * /var/www/html/
# Exposer les ports pour Apache
EXPOSE 81 

# Commande à exécuter lors du démarrage du conteneur
CMD ["apache2ctl", "-D", "FOREGROUND"]
