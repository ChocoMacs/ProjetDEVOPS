from flask import Flask, render_template, request, jsonify, redirect, url_for
import mysql.connector
import logging
import os

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.DEBUG)

# Configuration de la base de données super
db_config = {
    'host': os.getenv('DATABASE_HOST', 'db'),
    'port': int(os.getenv('DATABASE_PORT', 3306)),
    'user': os.getenv('DATABASE_USER', 'myapp'),
    'password': os.getenv('DATABASE_PASSWORD', 'password'),
    'database': os.getenv('DATABASE_NAME', 'mydatabase')
}

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/comments", methods=["POST"])
def add_comment():
    try:
        comment = request.form.get("comment")
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()
        cursor.execute("INSERT INTO comments (content) VALUES (%s)", (comment,))
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
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()
        cursor.execute("SELECT content FROM comments")
        comments = cursor.fetchall()
        cursor.close()
        connection.close()
        return render_template("view_comments.html", comments=comments)
    except Exception as e:
        logging.error("Error fetching comments: %s", e)
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
