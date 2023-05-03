from config import mysql
from flask import Blueprint, request, render_template, Flask,flash,jsonify
import pymysql
from app import app

parent_bp = Blueprint('parent', __name__)

#Route pour ajouter un parent
@app.route('/parent/add', methods = ['POST'])
def parent_add():
    try:
        json = request.json
        functionParent = json['functionParent']
        identificationNumber = json['identificationNumber']

        if functionParent and identificationNumber and request.method == 'POST':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'insert into parent(functionParent, identificationNumber) values (%s, %s)'
            bind_data = (functionParent, identificationNumber)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Parent added')
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

#Route pour le get de tous 
@app.route('/parent/get', methods=['GET'])
def get_parents():
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM parent'
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


#Route pour le get by id
@app.route('/parent/get/<int:parent_id>', methods=['GET'])
def getParentById(parent_id):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)
        query = 'SELECT * FROM parent WHERE idParent = %s'
        cursor.execute(query, (parent_id,))
        row = cursor.fetchone()

        if row:
            response = jsonify(row)
            response.status_code = 200
            return response
        else:
            message = {'status': 404, 'message': 'Parent not found'}
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
@app.route('/parent/update/<int:idParent>', methods=['PUT'])
def parent_update(idParent):
    try:
        json = request.json
        functionParent = json['functionParent']

        if functionParent and request.method == 'PUT':
            db_con = mysql.connect()
            cursor = db_con.cursor(pymysql.cursors.DictCursor)
            query = 'UPDATE parent SET functionParent=%s WHERE idParent=%d'
            bind_data = (functionParent, idParent)
            cursor.execute(query, bind_data)
            db_con.commit()
            response = jsonify('Parent updated')
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
@app.route('/parent/delete/<int:idParent>', methods=['DELETE'])
def parent_delete(idParent):
    try:
        db_con = mysql.connect()
        cursor = db_con.cursor(pymysql.cursors.DictCursor)

        # Vérification si le parent existe
        query_check = 'SELECT * FROM parent WHERE idParent=%d'
        cursor.execute(query_check, (idParent,))
        parent = cursor.fetchone()
        if not parent:
            response = jsonify({'status': 404, 'message': 'Parent non trouvé'})
            response.status_code = 404
            return response

        # Suppression du parent
        query_delete = 'DELETE FROM parent WHERE idParent=%d'
        cursor.execute(query_delete, (idParent,))
        db_con.commit()

        response = jsonify({'status': 200, 'message': 'Parent supprimé avec succès'})
        response.status_code = 200
        return response

    except Exception as e:
        print(e)
        message = {'status': 400, 'message': 'Erreur lors de la suppression du parent'}
        response = jsonify(message)
        response.status_code = 400
        return response

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'db_con' in locals():
            db_con.close()
