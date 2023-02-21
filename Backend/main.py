import pymysql
from app import app
from config import mysql
from flask import request, render_template, Flask,flash,jsonify

#Route pour ajouter un tuteur
@app.route('/tutor/add', methods = ['POST'])
def add_tutor():
    try:
        json = request.json
        ##idTutor = json['idTutor']
        functionTutor = json['functionTutor']
        
        if functionTutor and request.method == 'POST':
            db_con = mysql.connect()
            cursr = db_con.cursor(pymysql.cursors.DictCursor)
            requet_db = 'insert into tutor (functionTutor)values(%s)'
            bind_db = (functionTutor)
            cursr.execute(requet_db,bind_db)
            db_con.commit()
            return 'Tutor add'
        else:
            return 'error'
    except Exception as e:
        print(e)
        return 'error error'     
    finally:
        cursr.close()
        db_con.close() 

if(__name__ == '__main__'):
    app.run()
