from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

classe_bp = Blueprint('classe', __name__)

#Route d'ajout d'une classe
@app.route('/classe/add', methods = ['POST'])
def classe_add():
    try:
        json = request.json
        name = json['name']
        room = json['room']
        idYear = json['idYear']
        acronym = json['acronym']
        idEvaluation = json['idEvaluation']

        if name and room and idYear and acronym and idEvaluation and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into class(name, room, idYear, acronym, idEvaluation) values(%s,%s,%s,%s,%s)'
            bind_data = (name, room, idYear, acronym, idEvaluation)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Class added')
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
