from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

notificationjournal_bp = Blueprint('notificationjournal', __name__)

#Routes pour ajouter un notificationjournal
@app.route('/notificationjournal/add', methods = ['POST'])
def notificationjournal_add():
    try:
        json = request.json
        startDate = json['startDate']
        sendTime = json['sendTime']
        acknowledgeReception = json['acknowledgeReception']

        if  startDate and sendTime and acknowledgeReception and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into notificationjournal(startDate, sendTime, acknowledgeReception) values(%s,%s,%s)'
            bind_data = (startDate, sendTime, acknowledgeReception)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('NotificationJournal added')
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
