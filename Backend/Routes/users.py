from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

users_bp = Blueprint('users', __name__)

#Route d'ajoute de users
@app.route('/users/add', methods = ['POST'])
def users_add():
    try:
        json = request.json
        login = json['login']
        userPassword = json['userPassword']
        state = json['state']
        type = json['type']

        if login and userPassword and state and type and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into users(login, userPassword, state, type) values(%s,%s,%s,%s)'
            bind_data = (login, userPassword, state, type)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('User added')
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