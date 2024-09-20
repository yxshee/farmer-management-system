from app import db
from flask_login import UserMixin

class Register(db.Model):
    rid = db.Column(db.Integer, primary_key=True)
    farmername = db.Column(db.String(50))
    adharnumber = db.Column(db.String(50))
    age = db.Column(db.Integer)
    gender = db.Column(db.String(50))
    phonenumber = db.Column(db.String(50))
    address = db.Column(db.String(50))
    farming = db.Column(db.String(50))

class AddAgroProducts(db.Model):
    pid = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    productname = db.Column(db.String(100))
    productdesc = db.Column(db.String(300))
    price = db.Column(db.Integer)

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(1000))
