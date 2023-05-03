from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

notification_bp = Blueprint('notification', __name__)

#Route pour ajouter notification
@app.route('/notification/add', methods = ['POST'])
def notification_add():
    try:
        json = request.json
        object = json['object']
        type = json['type']
        sendPeriod = json['sendPeriod']
        idStatus = json['idStatus']
        idEvaluation = json['idEvaluation']
        idAbsence = json['idAbsence']
        idTutor = json['idTutor']
        idParent = json['idParent']
        idBulletin = json['idBulletin']

        if object and type and sendPeriod and idStatus and idEvaluation and idAbsence and idTutor and idParent and idBulletin and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into notification(object, type, sendPeriod, idStatus, idEvaluation, idAbsence, idTutor, idParent, idBulletin) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)'
            bind_data = (object, type, sendPeriod, idStatus, idEvaluation, idAbsence, idTutor, idParent, idBulletin)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Notification added')
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


#Route pour get notification
@app.route('/notification/get', methods=['GET'])
def get_all_notifications():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM notification'
        cursor.execute(query)
        rows = cursor.fetchall()

        response = jsonify(rows)
        response.status_code = 200
        return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'error'}
        response = jsonify(message)
        response.status_code = 400
        return response
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()
