from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

subject_bp = Blueprint('subject', __name__)

#Route pour ajouter subject
@app.route('/subject/add', methods = ['POST'])
def subject_add():
    try:
        json = request.json
        name = json['name']
        idTeacher = json['idTeacher']
        idClass = json['idSeance']
        idSeance = json['idSeance']

        if name and idTeacher and idClass and idSeance and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into subject(name, idTeacher, idClass, idSeance) values(%s,%s,%s,%s)'
            bin_data = (name, idTeacher, idClass, idSeance)
            cursor.execute(query, bin_data)
            db_con.commit()
            response = jsonify('Subject added')
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
