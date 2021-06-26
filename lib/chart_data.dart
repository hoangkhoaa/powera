import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'model/example_db.dart';

Future<Map> getChartDataDay(String deviceName) async {
  final client = RetryClient(http.Client());
  String private_key = await storage.read(key: 'private_key');
  String device = "";
  if (deviceName == "bk-iot-light") {
    device = "bk-iot-led";
  } else if (deviceName == "bk-iot-temp") {
    device = "bk-iot-speaker";
  } else {
    device = "bk-iot-relay";
  }
  try {
    var url = Uri.parse(api_url + '/get_data_chart_day');
    var response = await http.post(url, body: {
      'device': device,
      'private_key': private_key,
    });
    Map resData = jsonDecode(response.body);
    print('Response  status: ${response.statusCode}');
    print("get chart day of $device ");
    print(resData['data']);
    return resData['data'];
    //print('chart data request');
  } finally {
    client.close();
  }
}

Future<Map> getChartDataWeek(String deviceName) async {
  final client = RetryClient(http.Client());
  String private_key = await storage.read(key: 'private_key');
  String device = "";
  if (deviceName == "bk-iot-light") {
    device = "bk-iot-led";
  } else if (deviceName == "bk-iot-temp") {
    device = "bk-iot-speaker";
  } else {
    device = "bk-iot-relay";
  }
  try {
    var url = Uri.parse(api_url + '/get_data_chart_week');
    var response = await http.post(url, body: {
      'device': device,
      'private_key': private_key,
    });
    Map resData = jsonDecode(response.body);
    print('Response  status: ${response.statusCode}');
    print("get chart week of $device ");
    print(resData['data']);
    return resData['data'];

    //print('chart data request');
  } finally {
    client.close();
  }
}
