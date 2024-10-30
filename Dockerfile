# Utiliser l'image de base Ubuntu
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y git wget apache2 libapache2-mod-php php php-mysql mysql*

ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND

# 
RUN mv /var/www/html/index.html /var/www/html/index.html.old

# Cloner le dépôt contenant le dossier 'Application'
RUN git clone https://github.com/ChocoMacs/ProjetDEVOPS.git

# Copier le contenu du dossier 'Application' vers le répertoire de document d'Apache
RUN cp -r ProjetDEVOPS/Application/* /var/www/html/

# Exposer les ports pour Apache
EXPOSE 80

# Commande à exécuter lors du démarrage du conteneur
CMD ["apachectl", "-D", "FOREGROUND"]
