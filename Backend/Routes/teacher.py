from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

teacher_bp = Blueprint('teacher', __name__)

#Route pour ajouter teacher
@app.route('/teacher/add', methods = ['POST'])
def teacher_add():
    try:
        json = request.json
        category = json['category']

        if category and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into teacher(category) values(%s)'
            bind_data = (category)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Teacher added')
            response.status_code = 201
            return response
        else:
            message = {'status': 400, 'message': 'Entrée(s) invalide(s)'}
            response = jsonify(message)
            response.status_code = 400
            return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'error'}
        return 'error error'
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()
