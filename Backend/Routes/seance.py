from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

seance_bp = Blueprint('seance', __name__)

#Route pour ajouter une seance
@app.route('/seance/add', methods = ['POST'])
def seance_add():
    try:
        json = request.json
        startDate = json['startDate']
        duration = json['duration']
        type = json['type']

        if  startDate and duration and type and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into seance(startDate, duration, type) values(%s,%s,%s)'
            bind_data = ( startDate, duration, type)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Seance added')
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
