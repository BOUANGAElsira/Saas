import pymysql
from app import app
from config import mysql
from flask import request, render_template, Flask,flash,jsonify
from Routes.schoolYear import scholYear_bp
from Routes.tutor import tutor_bp
from Routes.period import period_bp
from Routes.law import law_bp
from Routes.profil import profil_bp
from Routes.groupp import groupp_bp
from Routes.subscription import subscription_bp
from Routes.responsable import responsable_bp
from Routes.etablishment import etablishment_bp
from Routes.notificationjournal import notificationjournal_bp
from Routes.bulletin import bulletin_bp
from Routes.evaluation import evaluation_bp
from Routes.seance import seance_bp
from Routes.porter_sur import porter_sur_bp
from Routes.teacher import teacher_bp
from Routes.classe import classe_bp
from Routes.subject import subject_bp
from Routes.student import student_bp
from Routes.inscription import inscription_bp
from Routes.parent import parent_bp
from Routes.absence import absence_bp
from Routes.notification import notification_bp
from Routes.users import users_bp
from Routes.person import person_bp

##Méthodes et routes

########################################### TOUT SUR TUTOR ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(tutor_bp) 



########################################### TOUT SUR SCHOOLYEAR ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(scholYear_bp)

########################################### TOUT SUR PERIOD ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(period_bp)


########################################### TOUT SUR LAW ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(law_bp)


########################################### TOUT SUR PROFIL ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(profil_bp)


########################################### TOUT SUR GROUPP ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(groupp_bp)


########################################### TOUT SUR SUBSCRIPTION ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(subscription_bp)


########################################### TOUT SUR RESPONSABLE ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(responsable_bp)


########################################### TOUT SUR ETABLSHMENT ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(etablishment_bp)


########################################## TOUT SUR NOTIFICATIONJOURNAL ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(notificationjournal_bp)


########################################### TOUT SUR BULLETIN ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(bulletin_bp)


########################################### TOUT SUR EVALUATION ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(evaluation_bp)


########################################### TOUT SUR SEANCE ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(seance_bp)


########################################### TOUT SUR PORTER_SUR ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(porter_sur_bp)


########################################### TOUT SUR TEACHER ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(teacher_bp)


########################################### TOUT SUR CLASSE ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(classe_bp)


########################################### TOUT SUR SUBJECT ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(subject_bp)



########################################### TOUT SUR STUDENT ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(student_bp)


########################################### TOUT SUR INSCRIPTION ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(inscription_bp)


########################################### TOUT SUR PARENT ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(parent_bp)


########################################### TOUT SUR ABSENCE ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(absence_bp)


########################################### TOUT SUR NOTIFICATION ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(notification_bp)


########################################### TOUT SUR USER ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(users_bp)


########################################### TOUT SUR PERSON ###########################################

#****************************************** POST ******************************************#
app.register_blueprint(person_bp)


if(__name__ == '__main__'):
    app.run(debug=True, host= "0.0.0.0", port= 5000)
