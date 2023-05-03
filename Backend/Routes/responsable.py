from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

responsable_bp = Blueprint('responsable', __name__)

#Route pour ajouter un responsable
@app.route('/responsable/add', methods = ['POST'])
def responsable_add():
    try:
        json = request.json
        startFunction = json['startFunction']
        endFunction = json['endFunction']

        if startFunction and endFunction and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into responsable(startFunction, endFunction) values(%s,%s)'
            bind_data = (startFunction, endFunction)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Responsable added')
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
