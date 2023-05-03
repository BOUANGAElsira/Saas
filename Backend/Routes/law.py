from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

law_bp = Blueprint('law', __name__)

#Route d'ajout de law
@app.route('/law/add', methods=['POST'])
def add_law():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor()
        query = "INSERT INTO law () VALUES ()"
        cursor.execute(query)
        db_con.commit()
        cursor.close()
        db_con.close()
        response = jsonify('Law added')
        response.status_code = 200
        return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'error'}
        return jsonify(message)
