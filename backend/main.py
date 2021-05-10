from flask import Flask


application = Flask(__name__)


# Define route
@application.route("", methods=['GET'])
def home():
    return "Hello!"
