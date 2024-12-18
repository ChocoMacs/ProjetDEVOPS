import os
import mysql.connector
from flask import Flask, request, jsonify, render_template, redirect, url_for
import logging

app = Flask(__name__)

# Connexion à la base de données
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv('DATABASE_HOST', 'db'),
        user=os.getenv('DATABASE_USER', 'myapp'),
        password=os.getenv('DATABASE_PASSWORD', 'password'),
        database=os.getenv('DATABASE_NAME', 'mydatabase')
    )

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/comments", methods=["POST"])
def add_comment():
    try:
        comment = request.form.get("comment")
        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("INSERT INTO comments (comment_text) VALUES (%s)", (comment,))
        connection.commit()
        cursor.close()
        connection.close()
        return redirect(url_for('view_comments'))
    except Exception as e:
        logging.error("Error adding comment: %s", e)
        return jsonify({"status": "error", "message": str(e)}), 500

@app.route("/view_comments", methods=["GET"])
def view_comments():
    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT comment_text FROM comments")
        comments = cursor.fetchall()
        cursor.close()
        connection.close()
        return render_template("view_comments.html", comments=comments)
    except Exception as e:
        logging.error("Error fetching comments: %s", e)
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
