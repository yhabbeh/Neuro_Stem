from datetime import datetime
from flask import Flask, request, jsonify
import json
import joblib
from predect import *

app = Flask(__name__)


@app.route("/")
def home():
    return "Home"


user_temp = '''[
   {
      "user": "admin",
      "password": "admin",
      "id" : 1001230
   },
   {
      "user": "lujain",
      "password": "lujain", 
        "id" : 1002332
   }
]'''
data_json = json.loads(user_temp)


@app.route('/login')
def login():
    for person in data_json:
        if person['user'] == request.get_json()['user'] and person['password'] == request.get_json()['password']:
            return person, 200


@app.get('/predict')
def predict():
    id = request.get_json()["id"]
    input = request.get_json()["input"]
    result = bool(pred(input))
    print(f'---------------{type(result)}000--{result}')
    return {"result": result,
            "input" : input,
            "id" : id,
            "DateTime": str(datetime.now())
            }


if __name__ == "__main__":
    app.run(debug=True)
