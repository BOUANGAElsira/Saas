from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

bulletin_bp = Blueprint('bulletin', __name__)

#Routes pour ajouter un bulletin
@app.route('/bulletin/add', methods = ['POST'])
def bulletin_add():
    try:
        json = request.json
        wording = json['wording']
        opinion = json['opinion']
        average = json['average']

        if wording and opinion and average and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into bulletin(wording, opinion, average) values(%s,%s,%s)'
            bind_data = (wording, opinion, average)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Bulletin added')
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

#Route de get de bulletin
@app.route('/bulletin/get', methods=['GET'])
def bulletin_get_all():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM bulletin'
        cursor.execute(query)
        result = cursor.fetchall()
        response = jsonify(result)
        response.status_code = 200
        return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'error'}
        return jsonify(message)
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()


#Route de delete de bulletin
@app.route('/bulletin/delete/<int:id>', methods=['DELETE'])
def bulletin_delete(id):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'delete from bulletin where id=%s'
        cursor.execute(query, id)
        db_con.commit()
        response = jsonify('Bulletin deleted')
        response.status_code = 200
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


#Route de update de bulletin
@app.route('/bulletin/update/<int:id>', methods=['PUT'])
def bulletin_update(id):
    try:
        json = request.json
        wording = json['wording']
        opinion = json['opinion']
        average = json['average']

        if wording and opinion and average and request.method == 'PUT':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'update bulletin set wording=%s, opinion=%s, average=%s where id=%s'
            bind_data = (wording, opinion, average, id)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Bulletin updated')
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