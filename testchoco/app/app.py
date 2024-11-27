from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__, template_folder="templates")

# Configuration de la base de données
db_config = {
    "host": "db",
    "user": "root",
    "password": "password",
    "database": "mydatabase"
}

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/comments", methods=["POST"])
def add_comment():
    comment = request.form.get("comment")
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()
    cursor.execute("INSERT INTO comments (content) VALUES (%s)", (comment,))
    connection.commit()
    cursor.close()
    connection.close()
    return "Comment added!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
