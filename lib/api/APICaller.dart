import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:powera/model/Led.dart';

class APICaller {
  APICaller();
  final _api_address = 'http://128.199.24.44:5000';

  Future<Led> get_led_device(String _id) async {
    final client = RetryClient(http.Client());
    try {
      var url = Uri.parse(this._api_address + '/led/get?_id=' + _id);
      var response = await http.get(url);
      print(response.body);
      Map data = jsonDecode(response.body);
      print(data);
      return Led(data['_id'], data['name'], data['data'], data['unit']);
    } finally {
      client.close();
    }
    return null;
  }

  Future<bool> update_led_device(
      String _id, String name, String data, String unit) async {
    final client = RetryClient(http.Client());
    try {
      var url = Uri.parse(this._api_address + '/led/update');
      var response = await http.post(url,
          body: {'_id': _id, 'name': name, 'data': data, 'unit': unit});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return true;
    } finally {
      client.close();
    }
    return false;
  }
}
