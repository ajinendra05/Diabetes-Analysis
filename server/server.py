import json
from flask import Flask, request, jsonify
import util

app = Flask(__name__)


@app.route('/Login', methods=['GET', 'POST'])
def check_LoginDetails():
    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        print(request_data)
        email=request_data["email"]
        password=request_data["password"]
        x=util.login(email=email,password=password)
        response = jsonify({
            'isValid': x
        })
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response
    response = jsonify({
            'estimated_Quality': False
        })
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route('/predict_Class', methods=['GET', 'POST'])
def predict_class2():
    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        print(request_data)
        pregnant=request_data["pregnant"]
        insulin=request_data["insulin"]
        bmi=request_data["bmi"]
        age=request_data["age"]
        glucose=request_data["glucose"]
        bp=request_data["bp"]
        pedigree=request_data["pedigree"]
        
        # print(DO)
        x=util.predict_class(float(pregnant), float(insulin), float(bmi), float(age),float(glucose),float(bp),float(pedigree))
        print(x)
        response = jsonify({
            
            'estimated_result': x[0],
            'estimated_Proba': x[1][1]

        })
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response

    return  jsonify({
            'estimated_values':['0',0],
            'estimated_result':'0',
            'estimated_Proba': 0
        })


if __name__ == "__main__":
    print("Starting Python Flask Server For Home Price Prediction...")
    util.load_saved_artifacts()
    app.run()
