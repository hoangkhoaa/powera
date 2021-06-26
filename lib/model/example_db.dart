import 'screen_model.dart';
import 'package:powera/bloc/navigation_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
String api_url = 'http://10.0.2.2:5000';
//http://127.0.0.1:5000
var deviceKeyMap = {
  "LED": "bk-iot-led",
  "Light sensor": "bk-iot-light",
  "SPEAKER": "bk-iot-speaker",
  "Temperature sensor": "bk-iot-temp",
  "Humidity sensor": "bk-iot-humid",
  "Water Pumper": "bk-iot-relay"
};

var deviceDescriptionMap = {
  "bk-iot-led": "LED light to enlight Dragon fruit garden",
  "bk-iot-light": "Light sensor for mesuring light",
  "bk-iot-speaker": "A speaker to alert fire",
  "bk-iot-temp": "Temperature sensor for detecting fire",
  "bk-iot-humid": "Humidity sensor for mesuring humitdity",
  "bk-iot-relay": "Water pump for Dragon fruit garden"
};

var deviceKeyMapByNavState = {
  NavItem.light_page: {
    "SenderDevice": "bk-iot-led",
    "ReceiverDevice": "bk-iot-light"
  },
  NavItem.heat_page: {
    "SenderDevice": "bk-iot-speaker",
    "ReceiverDevice": "bk-iot-temp"
  },
  NavItem.humid_page: {
    "SenderDevice": "bk-iot-relay",
    "ReceiverDevice": "bk-iot-humid"
  },
};
var dataDB = {
  'heat': [
    ScreenModel(
        "SPEAKER",
        """A speaker buzzer to arlert fire when receive the trigger from Temperature sensor. Speaker buzzer has value from range 0 to 1023 
        """,
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "99"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        false,
        "assets/images/buzzel.jpg"),
    ScreenModel(
        "Temperature sensor",
        """Temperature sensor for mesuring Temperature and Humidity. It return a value of Temperature in degree Celsius and Humidity in percentage
        """,
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Temperature", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        false,
        "assets/images/heat_sensor.jpg")
  ],
  'light': [
    ScreenModel(
        "LED",
        "LED Light to enlight Dragon fruit garden. There are 2 option for led light: RED and BLUE",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        false,
        "assets/images/led_light.jpg"),
    ScreenModel(
        "Light sensor",
        "Light sensor for mesuring light to control LED Light. Value of Light sensor falls between 0 to 1023",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        false,
        "assets/images/light_sensor.jpg")
  ],
  'humid': [
    ScreenModel(
        "Water Pumper",
        "A Relay to control Water pump for Dragon fruit garden. It can be triggerd by manual or trigger from soil humidity",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        false,
        "assets/images/relay.jpg"),
    ScreenModel(
        "Humidity sensor",
        "Humidity sensor for mesuring humitdity of soil. ",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        false,
        "assets/images/humidtity.png")
  ],
};
