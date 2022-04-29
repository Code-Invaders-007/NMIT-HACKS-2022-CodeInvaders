import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import sys,os

sys.path.append('Backend/Python/face.py')
import face as f

cred = credentials.Certificate("Backend/Python/face-recog-attendance-007-firebase-adminsdk-ztyev-e19d37cfae.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

name = 'Abhishek'
usn = '1SI20AD002'
facedata =    [1,2,3,4,5,6,]

def write_data( facedata ):

        data = {
        # data list in json

        "name" :name
        }

        dept_ref = db.collection('department').document('ai')
        year_ref = dept_ref.collection('Year').document('1')
        sect_ref = year_ref.collection('Section').document('A')
        sect_ref.collection('student').document(usn).set(data,merge=True)
        print("data Entered")
        
        
def fetch_data() :
        dept_ref = db.collection('department').document('ai')
        year_ref = dept_ref.collection('Year').document('1')
        sect_ref = year_ref.collection('Section').document('A')
        result = sect_ref.collection('student').document('1SI20AD002').get()            
        print(result.to_dict())

        print(result)
# write_data(facedata)
fetch_data()
f.logic_face()