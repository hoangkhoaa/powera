import 'screen_model.dart';
import 'package:powera/bloc/navigation_bloc.dart';
var deviceKeyMap = {
  "LED light" : "light.led",
  "Light sensor": "light.light-sensor",
  "Speaker buzzer": "heat.speaker-buzzer",
  "Temperature sensor": "heat.temperature-sensor",
  "Humidity sensor": "water.humidity-sensor",
  "Water pump": "water.relay-circuit"
};

var deviceDescriptionMap = {
  "light.led" : "LED light to enlight Dragon fruit garden",
  "light.light-sensor": "Light sensor for mesuring light",
  "heat.speaker-buzzer": "A speaker to alert fire",
  "heat.temperature-sensor": "Temperature sensor for detecting fire",
  "water.humidity-sensor": "Humidity sensor for mesuring humitdity",
  "water.relay-circuit": "Water pump for Dragon fruit garden"
};



var deviceKeyMapByNavState = {
  NavItem.light_page : {"SenderDevice": "light.led", "ReceiverDevice": "light.light-sensor"},
  NavItem.heat_page : {"SenderDevice": "heat.speaker-buzzer", "ReceiverDevice": "heat.temperature-sensor"},
  NavItem.humid_page : {"SenderDevice": "water.relay-circuit", "ReceiverDevice": "water.humidity-sensor"},
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
