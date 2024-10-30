# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer des dépendances (par exemple pour MySQL)
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloadsapachefriends.global.ssl.fastly.net/xampp/7.4.10/xampp-linux-x64-7.4.10-0-installer.run && \
    chmod +x xampp-linux-x64-7.4.10-0-installer.run && \
    ./xampp-linux-x64-7.4.10-0-installer.run

# Exposer le port pour accéder à XAMPP
EXPOSE 8081

# Commande pour démarrer XAMPP
CMD ["/opt/lampp/lampp", "start"]
