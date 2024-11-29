# Utilisation de l'image officielle Python
FROM python:3.9-slim

# Définition du répertoire de travail
WORKDIR /app

# Installation des dépendances nécessaires
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie du code de l'application
COPY . .

# Expose le port utilisé par Flask
EXPOSE 5000

# Commande pour démarrer l'application
CMD ["python", "app.py"]
