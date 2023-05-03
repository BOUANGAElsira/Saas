from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app
from config import ma
import base64

absence_bp = Blueprint('absence', __name__)

""" class AbsenceSchema(ma.Schema):
    class Meta:
        fields = ('') 
 """

#Route pour ajouter absence
@app.route('/absence/add', methods = ['POST'])
def absence_add():
    try:
        json = request.json
        startDate = json['startDate']
        endDate = json['endDate']
        observation = json['observation']
        justification = json['justification']
        justificationPiece = json['justificationPiece']
        idSeance = json['idSeance']
        identificationNumber = json['identificationNumber']

        if startDate and endDate and observation and justification and justificationPiece and idSeance and idSeance and identificationNumber and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into absence(startDate, endDate, observation, justification, justificationPiece, idSeance, identificationNumber) values(%s,%s,%s,%s,%s,%s,%s)'
            bind_data = (startDate, endDate, observation, justification, justificationPiece, idSeance, identificationNumber)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Absence added')
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

#Show all absense
@app.route('/absence/get', methods=['GET'])
def get_all_absences():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT startDate, endDate, observation, justification, idSeance, identificationNumber, justificationPiece FROM absence'
        cursor.execute(query)
        rows = cursor.fetchall()

        # Convertir les données blob en chaînes Base64
        for row in rows:
            if row['justificationPiece'] is not None:
                row['justificationPiece'] = base64.b64encode(row['justificationPiece']).decode('utf-8')

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


#Show absense by id
@app.route('/absence/get/<int:absence_id>', methods=['GET'])
def getAbsenceById(absence_id):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT startDate, endDate, observation, justification, idSeance, identificationNumber, justificationPiece FROM absence WHERE idAbsence = %s'
        cursor.execute(query, (absence_id,))
        row = cursor.fetchone()

        if row:
            # Convertir les données blob en chaîne Base64 si nécessaire
            if row['justificationPiece'] is not None:
                row['justificationPiece'] = base64.b64encode(row['justificationPiece']).decode('utf-8')

            response = jsonify(row)
            response.status_code = 200
            return response
        else:
            message = {'status': 404, 'message': 'Absence not found'}
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




#Delete absence
@app.route('/absence/delete/<int:id>', methods=['DELETE'])
def absence_delete(id):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        cursor.execute('DELETE FROM absence WHERE id = %s', id)
        db_con.commit()
        response = jsonify('Absence deleted')
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

#Update
@app.route('/absence/update/<int:id>', methods=['PUT'])
def update_absence(id):
    try:
        json = request.json
        startDate = json['startDate']
        endDate = json['endDate']
        observation = json['observation']
        justification = json['justification']
        justificationPiece = json['justificationPiece']
        idSeance = json['idSeance']
        identificationNumber = json['identificationNumber']

        if startDate and endDate and observation and justification and justificationPiece and idSeance and identificationNumber and request.method == 'PUT':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'UPDATE absence SET startDate = %s, endDate = %s, observation = %s, justification = %s, justificationPiece = %s, idSeance = %s, identificationNumber = %s WHERE id = %s'
            bind_data = (startDate, endDate, observation, justification, justificationPiece, idSeance, identificationNumber, id)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Absence updated')
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
