from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# Connexion à la base de données
def get_db_connection():
    return mysql.connector.connect(
        host="db",  # Nom du service défini dans docker-compose.yml
        user="root",
        password="example",
        database="mydatabase"
    )

# Page d'accueil
@app.route('/')
def index():
    return render_template('index.html')

# Voir les tables de la base de données
@app.route('/tables')
def show_tables():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()
    conn.close()
    return render_template('show_tables.html', tables=tables)

# Ajouter des informations dans une table
@app.route('/add', methods=['GET', 'POST'])
def add_info():
    if request.method == 'POST':
        comment = request.form['comment']
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO comments (text) VALUES (%s)", (comment,))
        conn.commit()
        conn.close()
        return redirect(url_for('index'))
    return render_template('add_info.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
