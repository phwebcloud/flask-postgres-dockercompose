from flask import Flask, render_template, request, jsonify
from time import sleep
import psycopg2
import os

app = Flask(__name__)

host = os.getenv("DB_HOST")
database = os.getenv("DB_NAME")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWD")

@app.route('/', methods=['GET','POST'])
def index():
    if request.method == 'POST':
        message = request.form.get("message")
        app.logger.info(message)
        save(message)
    return render_template('index.html', data=read())

def save(message):
    conn = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )
    cur = conn.cursor()
    sql = "INSERT INTO messages(message) VALUES(%s);"
    cur.execute(sql, (message,))
    conn.commit()
    cur.close()
    conn.close()

def read():
    conn = psycopg2.connect(
           host=host,
           database=database,
           user=user,
           password=password
       )
    db = conn.cursor()
    db.execute("SELECT * FROM messages")
    data = db.fetchall()
    db.close()
    conn.close()
    return data

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)

