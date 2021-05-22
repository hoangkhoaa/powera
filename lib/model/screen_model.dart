class ScreenModel {
  String deviceName;
  String deviceDis;
  bool isOn = false;
  List<AttributeModel> attributeList;
  ScreenModel(this.deviceName, this.deviceDis, this.attributeList, this.isOn);
}

class AttributeModel {
  String attribute;
  String value;
  String unit;
  String maxValue;
  String minValue;
  AttributeModel(
      {this.attribute, this.value, this.maxValue = "0", this.minValue = "100", this.unit = ""});
}
