from flask import Flask

app = Flask(__name__)

from flask_cors import CORS

CORS(app)

from app import routes
