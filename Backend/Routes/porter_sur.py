from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

porter_sur_bp = Blueprint('porter_sur',__name__)

#Route d'ajout de porter_sur
@app.route('/porter_sur/add', methods = ['POST'])
def porter_sur_add():
    try:
        json = request.json
        idEvaluation = json['idEvaluation']
        idBulletin = json['idBulletin']

        if idEvaluation and idBulletin and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into porter_sur(idEvaluation, idBulletin) values(%s,%s)'
            bind_data = (idEvaluation, idBulletin)
            db_con.commit()
            response = jsonify('Porter sur ajouté')
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
            