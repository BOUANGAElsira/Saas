""" #Requêtes concernant inscription
import requests
import base64
from payload import payload

with open("assets/justificatif-absence.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read()).decode('utf-8')

payload["justificationPiece"] = encoded_string

url = 'http://127.0.0.1:5000/absence/add'
headers = {'Content-Type': 'application/json'}

response = requests.post(url, json=payload, headers=headers)

print(response.status_code)
 """

"""  import base64
import os

# ...

@app.route('/absence/add', methods=['POST'])
def absence_add():
    payload = request.get_json()

    # extraire le champs 'justificationPiece' de la charge utile JSON
    encoded_image = payload.get('justificationPiece')

    # décoder l'image encodée en base64
    image_data = base64.b64decode(encoded_image)

    # sauvegarder l'image sur le serveur
    with open('assets/justificatif-absence.jpg', 'wb') as f:
        f.write(image_data)

    # ...
 """