import time
from datetime import datetime
from flask import Flask, request, jsonify
import json
from predect import *

app = Flask(__name__)


@app.route("/")
def home():
    return "Home"


user_temp = '''[
   {
      "username": "admin",
      "password": "admin",
      "id" : 1001230
   },
   {
      "username": "lujain",
      "password": "lujain", 
        "id" : 1002332
   }
]'''
data_json = json.loads(user_temp)


@app.post('/login')
def login():
    time.sleep(5)
    for person in data_json:
        if person['username'] == request.get_json()['username'] and person['password'] == request.get_json()[
            'password']:
            return {"isSuccess": True}, 200
    return {"isSuccess": False}, 200


@app.get('/predict')
def predict():
    id = request.get_json()["id"]
    input = request.get_json()["input"]
    result = bool(pred(input))
    print(f'---------------{type(result)}000--{result}')
    return {"result": result,
            "input": input,
            "id": id,
            "DateTime": str(datetime.now())
            }


if __name__ == "__main__":
    app.run(host='10.10.100.158', port=5000)
