from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

scholYear_bp = Blueprint('schoolYear', __name__)

#Route pour ajouter une année
@app.route('/schoolyear/add', methods = ['POST'])
def add_schoolyear():
    try:
        json = request.json
        ##idSchoolYear = json['idSchoolYear']
        startDate = json['startDate']
        endDate = json['endDate']
        wording = json['wording']
        state  = json['state']
        
        if startDate and endDate and wording and state and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into schoolyear (startDate, endDate, wording, state)values(%s,%s,%s,%s)'
            bind_data = (startDate, endDate, wording, state)
            cursor.execute(query,bind_data)
            db_con.commit()
            response = jsonify('SchoolYear added')
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
