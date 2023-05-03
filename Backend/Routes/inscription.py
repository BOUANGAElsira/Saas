from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

inscription_bp = Blueprint('inscription', __name__)

#Route pour ajouter une inscription
@app.route('/inscription/add', methods = ['POST'])
def inscription_add():
    try:
        json = request.json
        identificationNumber = json['identificationNumber']
        idYear = json['idYear']
        idClass = json['idClass']

        if identificationNumber and idYear and idClass and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into inscription(identificationNumber, idYear, idClass) values(%s,%s,%s)'
            bind_data = (identificationNumber, idYear, idClass)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Inscription added')
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
