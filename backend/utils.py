from flask import jsonify

def get_device(database, device, _id):
    try:
        data = database[device].find_one({"_id": _id})
    except Exception as e:
        print(e)
        return str(e)
    return data


def update_device(database, device, _id, name, data, unit):
    try:
        data = database[device].update_one({'_id': _id}, {
            "$set": {
                "_id": _id,
                "name": name,
                "data": data,
                "unit": unit
            }
        }, upsert=True)
    except Exception as e:
        print(e)
        return str(e)
    return True


def remove_divice(database, device, _id):
    try:
        data = database[device].delete_one({"_id": _id})
    except Exception as e:
        print(e)
        return str(e)
    
    return jsonify(message="Delete successfully")


def view_chart_device(database, device, _id):
    return "pass"