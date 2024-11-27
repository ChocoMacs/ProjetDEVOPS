from flask import Flask
import mysql.connector

app = Flask(__name__)

@app.route("/")
def index():
    return "Welcome to My Simple App!"

@app.route("/db")
def db_test():
    try:
        conn = mysql.connector.connect(
            host="db",
            user="root",
            password="password",
            database="mydatabase"
        )
        cursor = conn.cursor()
        cursor.execute("SHOW TABLES;")
        tables = cursor.fetchall()
        return f"Connected to DB! Tables: {tables}"
    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
