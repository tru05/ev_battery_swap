from flask import Flask, render_template, request, jsonify
import mysql.connector
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

def get_db_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',                 
        password='trusha',        
        database='ev_swap'           
    )

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/api/stations')
def get_stations():
    city = request.args.get('city', '').strip()
    zip_code = request.args.get('zip', '').strip()

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        query = "SELECT * FROM stations WHERE 1=1"
        params = []

        if city:
            query += " AND LOWER(city) = LOWER(%s)"
            params.append(city)
        if zip_code:
            query += " AND zip_code = %s"
            params.append(zip_code)

        cursor.execute(query, tuple(params))
        stations = cursor.fetchall()
        cursor.close()
        conn.close()

        return jsonify(stations)
    except Exception as e:
        return jsonify({"error": str(e)})

@app.route('/test-db')
def test_db():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT DATABASE();")
        db = cursor.fetchone()
        cursor.close()
        conn.close()
        return f"✅ Connected to database: {db[0]}"
    except Exception as e:
        return f"❌ Error: {str(e)}"

if __name__ == '__main__':
    app.run(debug=True)
