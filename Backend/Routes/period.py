from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

period_bp = Blueprint('period', __name__)

#Route pour ajouter une periode 
@app.route('/period/add', methods = ['POST'])
def period_add():
    try:
        json = request.json
        name = json['name']
        startDate = json['startDate']
        endDate = json['endDate']
        state  = json['state']
        idYear = json['idYear']
        idBulletin = json['idBulletin']

        if name and startDate and endDate and state and idYear and idBulletin and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into period (name, startDate, endDate, state, idYear, idBulletin)values(%s,%s,%s,%s,%s,%s)'
            bind_data = (name, startDate, endDate, state, idYear, idBulletin)
            cursor.execute(query,bind_data)
            db_con.commit()
            response = jsonify('Period added')
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
