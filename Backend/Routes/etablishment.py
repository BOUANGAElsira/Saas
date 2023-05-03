from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

etablishment_bp = Blueprint('etablishment', __name__)

#Requêts pour ajouter un etablishment 
@app.route('/etablishment/add', methods = ['POST'])
def etablishment_add():
    try:
        json = request.json
        acronym = json['acronym']
        name = json['name']
        type = json['type']
        idSubscription = json['idSubscription']
        idResponsable = json['idResponsable']

        if acronym and name and type and idSubscription and idResponsable and request.method =='POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into etablishment(acronym, name, type, idSubscription, idResponsable) values(%s,%s,%s,%s,%s)'
            bind_data = (acronym, name, type, idSubscription, idResponsable)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Etablishment added')
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

#Route pour le get
@app.route('/etablishment/get', methods=['GET'])
def etablishment_all():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM etablishment'
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


#Route pour le update
@app.route('/etablishment/update', methods=['PUT'])
def etablishment_update():
    try:
        json = request.json
        acronym = json['acronym']
        name = json['name']
        type = json['type']
        idSubscription = json['idSubscription']
        idResponsable = json['idResponsable']

        if acronym and name and type and idSubscription and idResponsable and request.method == 'PUT':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'UPDATE etablishment SET name = %s, type = %s, idSubscription = %s, idResponsable = %s WHERE acronym = %s'
            bind_data = (name, type, idSubscription, idResponsable, acronym)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Etablishment updated')
            response.status_code = 200
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

#Route pour le delete
@app.route('/etablishment/delete/<string:acronym>', methods=['DELETE'])
def etablishment_delete(acronym):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = "DELETE FROM etablishment WHERE acronym = %s"
        bind_data = (acronym,)
        cursor.execute(query, bind_data)
        db_con.commit()
        response = jsonify('Etablishment deleted')
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
