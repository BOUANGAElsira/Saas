from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

subscription_bp = Blueprint('subscription', __name__)

#Route d'ajout de subsscription
@app.route('/subscription/add', methods = ['POST'])
def subscription_add():
    try:
        json = request.json
        yearSubscription = json['yearSubscription']
        startDate = json['startDate']
        endDate = json['endDate']
        idYear = json['idYear']

        if yearSubscription and startDate and endDate and idYear and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into subscription(yearSubscription, startDate, endDate, idYear) values(%s,%s,%s,%s)'
            bind_data = (yearSubscription, startDate, endDate, idYear)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Subscription added')
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

