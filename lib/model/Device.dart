import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:powera/model/example_db.dart';
import 'package:powera/model/screen_model.dart';

class Device {
  String _api_address = api_url;
  String deviceKey;
  String id;
  String name;
  String description;
  String data = "0";
  String unit = "";
  bool auto = false;

  Device(String deviceKey) {
    this.deviceKey = deviceKey;
    // Default valuse
    this.name = deviceKeyMap.keys.firstWhere(
        (k) => deviceKeyMap[k] == this.deviceKey,
        orElse: () => null);
    this.description = deviceDescriptionMap[this.deviceKey];
  }

  Future<void> getDevice() async {
    final client = RetryClient(http.Client());
    try {
      var url = Uri.parse(this._api_address + '/get_device');
      String private_key = await storage.read(key: 'private_key');
      var response = await http
          .post(url, body: {'private_key': private_key, 'device': deviceKey});
      print(response.body);
      Map resData = jsonDecode(response.body);
      this.id = resData['id'];
      this.name = resData['name'] == null ? this.name : resData['name'];
      this.data = resData['data'].toString();
      // this.unit = resData['unit'];
    } finally {
      client.close();
    }
  }

  Future<void> updateDevice(String name, String data, String unit) async {
    final client = RetryClient(http.Client());
    try {
      await getDevice();
      var url = Uri.parse(this._api_address + '/update_device');
      String private_key = await storage.read(key: 'private_key');
      var response = await http.post(url, body: {
        'private_key': private_key,
        'device': this.deviceKey,
        'id': this.id,
        'name': name,
        'data': data,
        'unit': unit
      });
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      await getDevice();
    } finally {
      client.close();
    }
  }
}

class SenderDevice extends Device {
  SenderDevice(String deviceKey) : super(deviceKey);
}

class ReceiverDevice extends Device {
  String label;
  AttributeModel attribute;
  String dataLabel;
  String minValue;
  String maxValue;
  ReceiverDevice(String deviceKey) : super(deviceKey) {
    switch (deviceKey) {
      case 'bk-iot-light':
        {
          this.minValue = "0";
          this.maxValue = "1023";
          this.dataLabel = "Brightness";
        }
        break;
      case 'bk-iot-temp':
        {
          this.minValue = "0";
          this.maxValue = "100";
          this.dataLabel = "Temperature";
          this.unit = "°C";
        }
        break;
      case 'bk-iot-humid':
        {
          this.minValue = "0";
          this.maxValue = "100";
          this.dataLabel = "Humidity";
          this.unit = "%";
        }
        break;
    }
  }
}
