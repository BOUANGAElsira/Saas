from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app
import base64

person_bp = Blueprint('person', __name__)

#Route d'ajout de person
@app.route('/person/add', methods = ['POST'])
def person_add():
    try:
        json = request.json
        name = json['name']
        firstname = json['firstname']
        email = json['email']
        mobilPhone = json['mobilPhone']
        fixedPhone = json['fixedPhone']
        address = json['address']
        CNI = json['CNI']
        photo = json['photo']
        type = json['type']

        if name and firstname and email and mobilPhone and fixedPhone and address and CNI and photo and type and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into person(name, firstname, email, mobilPhone, fixedPhone, address, CNI, photo, type) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)'
            bind_data = (name, firstname, email, mobilPhone, fixedPhone, address, CNI, photo, type)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Person added')
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
#Route de get de person
@app.route('/person/get', methods=['GET'])
def get_all_persons():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT name, firstname, email, mobilPhone, fixedPhone, address, CONVERT(CNI USING utf8) AS CNI, CONVERT(photo USING utf8) AS photo, type FROM person'
        cursor.execute(query)
        rows = cursor.fetchall()
        
        # Conversion des données blob en chaînes de caractères Base64
        # Conversion des données blob en chaînes de caractères Base64
        for row in rows:
            if row['CNI'] is not None:
                row['CNI'] = base64.b64encode(row['CNI'].encode('utf-8')).decode('utf-8')
            if row['photo'] is not None:
                row['photo'] = base64.b64encode(row['photo'].encode('utf-8')).decode('utf-8')


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
