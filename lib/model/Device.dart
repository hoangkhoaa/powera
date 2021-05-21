import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class Device {
  final _api_address = 'http://192.168.1.2:5000';
  String deviceKey;
  String _id;
  String name;
  String data;
  String unit;
  Device(String deviceKey){
    this.deviceKey = deviceKey;
  }

  Future<void> getDevice() async {
    final client = RetryClient(http.Client());
    try {
      var url = Uri.parse(this._api_address + '/get_device?device=' + deviceKey);
      var response = await http.get(url);
      Map resData = jsonDecode(response.body);
      this._id = resData['_id'];
      this.name = resData['name'];
      this.data = resData['data'];
      this.unit = resData['unit'];
    } finally {
      client.close();
    }
  }

  Future<void> updateDevice(String name, String data, String unit) async {
    final client = RetryClient(http.Client());
    try {
      var url = Uri.parse(this._api_address + '/update_device');
      print({'device': this.deviceKey, '_id': this._id, 'name': name, 'data': data, 'unit': unit});
      var response = await http.post(url,
          body: {'device': this.deviceKey, '_id': this._id, 'name': name, 'data': data, 'unit': unit});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      await getDevice();
    } finally {
      client.close();
    }
  }

}