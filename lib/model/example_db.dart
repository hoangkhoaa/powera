import 'screen_model.dart';
import 'package:powera/bloc/navigation_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
String api_url = 'http://192.168.1.2:5000';

var deviceKeyMap = {
  "LED light" : "bk-iot-led",
  "Light sensor": "bk-iot-light",
  "Speaker buzzer": "bk-iot-speaker",
  "Temperature sensor": "bk-iot-temp",
  "Humidity sensor": "bk-iot-humid",
  "Water pump": "bk-iot-relay"
};

var deviceDescriptionMap = {
  "bk-iot-led" : "LED light to enlight Dragon fruit garden",
  "bk-iot-light": "Light sensor for mesuring light",
  "bk-iot-speaker": "A speaker to alert fire",
  "bk-iot-temp": "Temperature sensor for detecting fire",
  "bk-iot-humid": "Humidity sensor for mesuring humitdity",
  "bk-iot-relay": "Water pump for Dragon fruit garden"
};



var deviceKeyMapByNavState = {
  NavItem.light_page : {"SenderDevice": "bk-iot-led", "ReceiverDevice": "bk-iot-light"},
  NavItem.heat_page : {"SenderDevice": "bk-iot-speaker", "ReceiverDevice": "bk-iot-temp"},
  NavItem.humid_page : {"SenderDevice": "bk-iot-relay", "ReceiverDevice": "bk-iot-humid"},
};
var dataDB = {
  'heat': [
    ScreenModel(
        "Speaker buzzer",
        "A horn to alert fire",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "99"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        false),
    ScreenModel(
        "Temperature sensor",
        "Temperature sensor for detecting fire",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Temperature", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        false)
  ],
  'light': [
    ScreenModel(
        "LED light",
        "LED light to enlight Dragon fruit garden",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        false),
    ScreenModel(
        "Light sensor",
        "Light sensor for mesuring light",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        false)
  ],
  'humid': [
    ScreenModel(
        "Water pump",
        "Water pump for Dragon fruit garden",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        false),
    ScreenModel(
        "Humidity sensor",
        "Humidity sensor for mesuring humitdity",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        false)
  ],
};
