# Utiliser une image de base Ubuntu
FROM ubuntu:latest

# Installer des dépendances nécessaires
RUN apt-get update && \
    apt-get install -y wget apache2 libapache2-mod-php php php-mysql

# Exposer les ports pour Apache et MySQL
EXPOSE 81  # Port pour Apache
EXPOSE 3306  # Port pour MySQL

# Copier des fichiers de configuration ou du code ici (si nécessaire)
# COPY ./path/to/your/files /var/www/html/

# Démarrer Apache en mode non-bloquant
CMD ["apachectl", "-D", "FOREGROUND"]
