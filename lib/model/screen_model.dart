class ScreenModel {
  String deviceName;
  String deviceDis;
  bool isOn;
  List<AttributeModel> attributeList;
  ScreenModel(this.deviceName, this.deviceDis, this.attributeList, this.isOn);
}

class AttributeModel {
  String attribute;
  String value;
  AttributeModel(this.attribute, this.value);
}
