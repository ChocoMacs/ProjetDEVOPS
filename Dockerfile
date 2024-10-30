# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql && \
    apt-get clean

# Exposer les ports pour Apache et MySQL
EXPOSE 81  # Port pour Apache sur 81
EXPOSE 3306  # Port pour MySQL

# Modifier la configuration d'Apache pour écouter sur le port 81
RUN sed -i 's/:80/:81/' /etc/apache2/ports.conf && \
    echo 'Listen 81' >> /etc/apache2/ports.conf

# Démarrer Apache et MySQL
CMD service mysql start && \
    service apache2 start && \
    tail -f /var/log/apache2/error.log
