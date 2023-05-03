from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

student_bp = Blueprint('student', __name__)

#Route pour ajouter student
@app.route('/student/add', methods = ['POST'])
def student_add():
    try:
        json = request.json
        abandon = json['abandon']
        acronym = json['acronym']
        idTutor = json['idTutor']
        idEvaluation = json['idEvaluation']
        idSubject = json['idSubject']

        if abandon and acronym and idTutor and idEvaluation and idSubject and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into student(abandon, acronym, idTutor, idEvaluation, idSubject) values(%s,%s,%s,%s,%s)'
            bind_data = (abandon, acronym, idTutor, idEvaluation, idSubject)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Student added')
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
@app.route('/student/get', methods=['GET'])
def get_all_students():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = "SELECT * FROM student"
        cursor.execute(query)
        students = cursor.fetchall()
        if students:
            response = jsonify(students)
            response.status_code = 200
            return response
        else:
            message = {'status': 404, 'message': 'Aucun étudiant trouvé'}
            response = jsonify(message)
            response.status_code = 404
            return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'Erreur lors de la récupération des étudiants'}
        response = jsonify(message)
        response.status_code = 400
        return response
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()

#Route pour le update
@app.route('/student/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    try:
        json = request.json
        abandon = json['abandon']
        acronym = json['acronym']
        idTutor = json['idTutor']
        idEvaluation = json['idEvaluation']
        idSubject = json['idSubject']
        if abandon and acronym and idTutor and idEvaluation and idSubject and request.method == 'PUT':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = "UPDATE student SET abandon=%s, acronym=%s, idTutor=%s, idEvaluation=%s, idSubject=%s WHERE identificationNumber=%s"
            bind_data = (abandon, acronym, idTutor, idEvaluation, idSubject, student_id)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Etudiant mis à jour')
            response.status_code = 200
            return response
        else:
            message = {'status': 400, 'message': 'Entrée(s) invalide(s)'}
            response = jsonify(message)
            response.status_code = 400
            return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'Erreur lors de la mise à jour de l\'étudiant'}
        response = jsonify(message)
        response.status_code = 400
        return response
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()


#Route pour le delete
@app.route('/student/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = "DELETE FROM student WHERE identificationNumber=%s"
        cursor.execute(query, student_id)
        db_con.commit()
        if cursor.rowcount > 0:
            response = jsonify('Etudiant supprimé')
            response.status_code = 200
            return response
        else:
            message = {'status': 404, 'message': 'Aucun étudiant trouvé avec cet ID'}
            response = jsonify(message)
            response.status_code = 404
            return response
    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'Erreur lors de la suppression de l\'étudiant'}
        response = jsonify(message)
        response.status_code = 400
        return response
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()
