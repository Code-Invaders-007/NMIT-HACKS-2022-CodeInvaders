import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("Backend/Python/face-recog-attendance-007-firebase-adminsdk-ztyev-e19d37cfae.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
usn = input("Enter USN")
name_stu = input("Enter your name")
doc_ref = db.collection(u'students').document(usn)
doc_ref.set({
    u'first': name_stu,
    u'last': u'Lovelace',
    u'born': 1815
})