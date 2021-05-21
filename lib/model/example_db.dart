import 'screen_model.dart';

var deviceKeyMap = {
  "LED light" : "light.led",
  "Light sensor": "light.light-sensor",
  "Speaker buzzer": "heat.speaker-buzzer",
  "Temperature sensor": "heat.temperature-sensor",
  "Humidity sensor": "water.humidity-sensor",
  "Water pump": "water.relay-circuit"
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
