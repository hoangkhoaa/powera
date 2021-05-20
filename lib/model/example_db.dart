import 'screen_model.dart';

var dataDB = {
  'heat': [
    ScreenModel(
        "Buzzel Horn",
        "A horn to alert fire",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "99"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        true),
    ScreenModel(
        "Heat sensor",
        "Heat sensor for detecting fire",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Temperature", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        true)
  ],
  'light': [
    ScreenModel(
        "LED light",
        "LED light to enlight Dragon fruit garden",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        true),
    ScreenModel(
        "Light sensor",
        "Light sensor for mesuring light",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        true)
  ],
  'humid': [
    ScreenModel(
        "Water pumps",
        "Water pumps for Dragon fruit garden",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Auto", value: "On")
        ],
        true),
    ScreenModel(
        "Land Humid sensor",
        "Land humid sensor for mesuring humitdity",
        [
          AttributeModel(attribute: "Status", value: "On"),
          AttributeModel(attribute: "Data", value: "50"),
          AttributeModel(attribute: "Auto", value: "On"),
        ],
        true)
  ],
};
