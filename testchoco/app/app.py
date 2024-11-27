from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# Configuration de la base de données
db_config = {
    'host': 'db',  # Le nom du conteneur de la base MySQL
    'user': 'root',
    'password': 'root',
    'database': 'test_db'
}

# Route principale (page d'accueil)
@app.route('/')
def home():
    return render_template('index.html')  # Charge la page avec les boutons

# Route pour afficher les tables
@app.route('/tables')
def view_tables():
    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()
        cursor.execute("SHOW TABLES;")
        tables = cursor.fetchall()
        cursor.close()
        connection.close()
        return render_template('tables.html', tables=tables)
    except Exception as e:
        return f"Erreur : {e}"

# Route pour ajouter un commentaire
@app.route('/add', methods=['GET', 'POST'])
def add_comment():
    if request.method == 'POST':
        name = request.form
