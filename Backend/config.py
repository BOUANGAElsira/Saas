from app import app
from flaskext.mysql import MySQL
from flask_marshmallow import Marshmallow

mysql = MySQL()

app.config['MYSQL_DATABASE_USER']= "root"
app.config['MYSQL_DATABASE_HOST']= "localhost"
app.config['MYSQL_DATABASE_PASSWORD']= ""
app.config['MYSQL_DATABASE_DB']= "saas"

mysql.init_app(app)
ma = Marshmallow(app)
