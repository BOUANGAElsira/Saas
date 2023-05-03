from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app
from config import ma

evaluation_bp = Blueprint('evaluation', __name__)


class EvaluationSchema(ma.Schema):
    class Meta:
        fields = ('rating', 'startDate', 'endDate', 'type', 'appreciation') 

evaluation_schema = EvaluationSchema()
evaluations_schema = EvaluationSchema(many=True)

#Requête pour ajouter une evaluation
@app.route('/evaluation/add', methods = ['POST'])
def evaluation_add():
    try:
        json = request.json
        rating = json['rating']
        startDate = json['startDate']
        endDate = json['endDate']
        type = json['type']
        appreciation = json['appreciation']

        if rating and startDate and endDate and type and appreciation and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into evaluation(rating, startDate, endDate, type, appreciation) values(%s,%s,%s,%s,%s)'
            bind_data = (rating, startDate, endDate, type, appreciation)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Evaluation added')
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

#Show all evaluations
@app.route('/evaluation/get', methods=['GET'])
def get_all_evaluations():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM evaluation'
        cursor.execute(query)
        evaluations = cursor.fetchall()
        response = jsonify(evaluations)
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

#Delete evaluation
@app.route('/evaluation/<int:id>', methods=['DELETE'])
def delete_evaluation(id):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'DELETE FROM evaluation WHERE idEvaluation = %s'
        cursor.execute(query, id)
        db_con.commit()
        response = jsonify('Evaluation deleted')
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

#Update evaluation
@app.route('/evaluation/<int:id>', methods=['PUT'])
def update_evaluation(id):
    try:
        json = request.json
        rating = json['rating']
        startDate = json['startDate']
        endDate = json['endDate']
        type = json['type']
        appreciation = json['appreciation']

        if rating and startDate and endDate and type and appreciation and request.method == 'PUT':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'UPDATE evaluation SET rating=%s, startDate=%s, endDate=%s, type=%s, appreciation=%s WHERE idEvaluation=%s'
            bind_data = (rating, startDate, endDate, type, appreciation, id)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Evaluation updated')
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
        response = jsonify(message)
        response.status_code = 400
        return response
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()

