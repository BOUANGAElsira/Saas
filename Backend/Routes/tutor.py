from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

tutor_bp = Blueprint('tutor', __name__)


#Route pour ajouter un tuteur
@app.route('/tutor/add', methods = ['POST'])
def add_tutor():
    try:
        json = request.json
        ##idTutor = json['idTutor']
        functionTutor = json['functionTutor']
        
        if functionTutor and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into tutor (functionTutor)values(%s)'
            bind_data = (functionTutor)
            cursor.execute(query,bind_data)
            db_con.commit()
            response = jsonify('Tutor added')
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
        cursor.close()
        db_con.close() 

#Route pour le get
@app.route('/tutor/get', methods=['GET'])
def get_tutors():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM tutor'
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


#Route pour get by id
@app.route('/tutor/get/<int:tutor_id>', methods=['GET'])
def getTutorById(tutor_id):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM tutor WHERE idTutor = %s'
        cursor.execute(query, (tutor_id,))
        row = cursor.fetchone()

        if row:
            response = jsonify(row)
            response.status_code = 200
            return response
        else:
            message = {'status': 404, 'message': 'Tutor not found'}
            response = jsonify(message)
            response.status_code = 404
            return response

    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'Error'}
        response = jsonify(message)
        response.status_code = 400
        return response

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()



#Route pour le update
@app.route('/tutor/update/<int:idTutor>', methods=['PUT'])
def update_tutor(idTutor):
    try:
        json = request.json
        functionTutor = json['functionTutor']
        
        if functionTutor and request.method == 'PUT':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'UPDATE tutor SET functionTutor=%s WHERE idTutor=%s'
            bind_data = (functionTutor, idTutor)
            cursor.execute(query,bind_data)
            db_con.commit()
            response = jsonify('Tutor updated')
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
        cursor.close()
        db_con.close()


#Route pour le delete