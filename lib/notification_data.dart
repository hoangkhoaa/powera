import 'dart:convert';

import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'package:powera/model/example_db.dart';

class NotificationP {
  String content;
  bool isSeen;
  double time;
  String timeFormatted;
  String uuid;
  NotificationP(
      this.content, this.isSeen, this.time, this.timeFormatted, this.uuid);
}

int getNumberUnSeen(List<NotificationP> data) {
  int val = 0;
  data.forEach((element) {
    if (!element.isSeen) {
      val++;
    }
    return val;
  });
  return val;
}

List<NotificationP> getListNotification(List data) {
  return data
      .map((e) => NotificationP(
          e['content'], e['seen'], e['time'], e['time_formatted'], e['uuid']))
      .toList();
}

Future<List<NotificationP>> getNotification() async {
  final client = RetryClient(http.Client());
  String private_key = await storage.read(key: 'private_key');
  try {
    var urlLight = Uri.parse(api_url + '/notifications');
    var response = await http.post(urlLight, body: {
      'private_key': private_key,
    });
    //print("RESPONSE_NOTFICATION:  ${response.body}");

    Map resData = jsonDecode(response.body);
    //print("RESPONSE_NOTFICATION_DATA:  ${resData['notifications']}");
    return getListNotification(resData['notifications']);
  } finally {
    client.close();
  }
}

Future<void> checkNotification() async {
  final client = RetryClient(http.Client());
  String private_key = await storage.read(key: 'private_key');
  try {
    var urlLight = Uri.parse(api_url + '/check_notification');
    var response = await http.post(urlLight, body: {
      'private_key': private_key,
    });
    print(response.body);
  } finally {
    client.close();
  }
}
