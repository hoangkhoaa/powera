import 'screen_model.dart';

var data = {
  'heat': [
    ScreenModel(
        "Buzzel Horn",
        "A horn to alert fire",
        [
          AttributeModel("Status", "On"),
          AttributeModel("Data", "99"),
          AttributeModel("Auto", "True")
        ],
        true),
    ScreenModel(
        "Heat sensor",
        "Heat sensor for detecting fire",
        [
          AttributeModel("Status", "On"),
          AttributeModel("Temperature", "50"),
          AttributeModel("Auto", "True"),
        ],
        true)
  ],
  'light': [
    ScreenModel("LED light", "LED light to enlight Dragon fruit garden",
        [AttributeModel("Status", "On"), AttributeModel("Auto", "True")], true),
    ScreenModel(
        "Light sensor",
        "Light sensor for mesuring light",
        [
          AttributeModel("Status", "On"),
          AttributeModel("Data", "50"),
          AttributeModel("Auto", "True"),
        ],
        true)
  ],
  'humid': [
    ScreenModel("Water pumps", "Water pumps for Dragon fruit garden",
        [AttributeModel("Status", "On"), AttributeModel("Auto", "True")], true),
    ScreenModel(
        "Land Humid sensor",
        "Land humid sensor for mesuring humitdity",
        [
          AttributeModel("Status", "On"),
          AttributeModel("Data", "50"),
          AttributeModel("Auto", "True"),
        ],
        true)
  ],
};
