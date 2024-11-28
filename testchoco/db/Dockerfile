FROM mysql:8.0

# Définir les variables d'environnement pour l'utilisateur root et le mot de passe
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=root

# Copier le script SQL d'initialisation
COPY init.sql /docker-entrypoint-initdb.d/

# Exposer le port MySQL
EXPOSE 3307
