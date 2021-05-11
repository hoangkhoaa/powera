from flask import Flask, jsonify, request
from flask_pymongo import PyMongo


application = Flask(__name__)
# Connect to database
application.config["MONGO_URI"] = "mongodb://localhost:27017/doan"
mongodb_client = PyMongo(application)
db = mongodb_client.db


# Define route
@application.route("/", methods=['GET'])
def home():
    return "Hello!"

# Led device
@application.route("/led/get")
def get_led_device():
    _id = request.args.get('_id')
    try:
        db.led.find_one({"_id":_id})
    except Exception as e:
        print(e)
        return e
    
    return jsonify(message="Query successfully")


@application.route('/led/update')
def update_led_device():
    _id = request.args.get('_id')
    name = request.args.get('name')
    data = request.args.get('data')
    unit = request.args.get('unit')
    print(_id, name, data, unit)
    try:
        db.led.update_one({'_id': _id}, {
        "$set" : {
            "_id": _id,
            "name": name,
            "data": data,
            "unit": unit
        }
    }, upsert=True)
    except Exception as e:
        print(e)
        return str(e)

    return jsonify(message="Update successfully")


@application.route('/led/remove')
def remove_led_device():
    _id = request.args.get('body')
    try :
        db.led.delete_one({"body": _id})
    except  Exception as e:
        return str(e)
    
    return jsonify(message="Delete successfully")
    
    
    
    
# DHT11
@application.route("/dht11")
def process_dht11_device():
    pass


# Light sensor
@application.route("/light-sensor")
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

if __name__ == '__main__':
    application.run(debug=True)