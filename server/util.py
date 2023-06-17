import pickle
import json
import numpy as np
import pandas as pd
from sklearn.preprocessing import LabelEncoder
import pickle


__model = None
model=None
def login(email,password):
   if email=='ajinendra05@gmail.com' and password=='Ajinendra':
      return True
   return False


def predict_class(pregnant,insulin,bmi,age,glucose,bp,pedigree):
        
        data = [[pregnant,insulin,bmi,age,glucose,bp,pedigree]] 
        with open('model.pkl', 'rb') as file:
           model = pickle.load(file)   
               
        df = pd.DataFrame(data, columns = ['pregnant','insulin','bmi','age','glucose','bp','pedigree']) 
        y_pred = model.predict(df)[0]
        probability=model.predict_proba(df)[0]
        
        return [y_pred,probability]



def load_saved_artifacts():
    print("loading saved artifacts...start")

        
       

    global model
    if model is None:
        with open('model.pkl', 'rb') as f:
            model = pickle.load(f)
    print("loading saved artifacts...done")

if __name__ == '__main__':
    load_saved_artifacts()
    print(model.predict([[6, 0, 33.6, 50, 148, 72, 0.627]])[0])
    print(predict_class(6, 0, 33.6, 50, 148, 72, 0.627))
