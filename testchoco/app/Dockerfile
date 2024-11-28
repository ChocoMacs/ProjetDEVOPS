FROM python:3.9-slim

# Installer les dépendances
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code de l'application
COPY app.py /app/app.py
COPY /templates/index.html /app/index.html

# Exposer le port Flask
EXPOSE 5000

# Commande pour démarrer l'application
CMD ["python", "app.py"]
