from flask import Flask
from flask_pymongo import PyMongo


application = Flask(__name__)
application.config["MONGO_URI"] = "mongodb://localhost:27017"
mongo = PyMongo(application)

# Define route
@application.route("", methods=['GET'])
def home():
    return "Hello!"

# Led device
@application.route("/led")
def process_led_device():
    pass


# DHT11
@application.route("/dht11")
def process_dht11_device():
    pass


# Light sensor
@application.route("light-sensor")
def process_light_sensor_device():
    pass


# Buzzer speaker
@application.route("/buzzer-speaker")
def process_buzzer_speaker_device():
    pass


# Pump mini
@application.route("/pump-mini")
def process_pump_mini_device():
    pass


# Relay circuit
@application.route('/relay-circuit')
def process_relay_circuit_device():
    pass
