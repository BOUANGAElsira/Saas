from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

profil_bp = Blueprint('profil', __name__)

#Route pour ajouter un profil
@app.route('/profil/add',methods = ['POST'])
def profil_add():
    try:
        json = request.json
        idLaw = json['idLaw']

        if idLaw and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into profil (idLaw) values(%s)'
            bind_data = (idLaw,) # ajouter une virgule pour créer un tuple
            cursor.execute(query,bind_data)
            db_con.commit()
            response = jsonify('Period added')
            response.status_code = 200
            return response
        else:
            message = {'status': 404, 'message': 'Entrée(s) invalide(s)'}
            response = jsonify(message)
            response.status_code = 404
            return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'erreur'}
        response = jsonify(message)
        response.status_code = 400
        return response
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()
