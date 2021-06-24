import 'package:http/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'chart_data.dart';
import 'model/example_db.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
Future<Map<String, dynamic>> checkSettingSave() async {
  SharedPreferences prefsTemp = await prefs;
  var data = Map<String, dynamic>();
  if (prefsTemp.getInt('lightColorVale') == null) {
    prefsTemp
        .setInt("lightSensorValue", 100)
        .then((bool success) => data['lightSensorValue'] = 100);
    prefsTemp
        .setInt("lightColorVale", 1)
        .then((bool success) => data['lightColorVale'] = 1);
    prefsTemp
        .setBool("lightAuto", true)
        .then((bool success) => data['lightAuto'] = true);
    prefsTemp
        .setInt("heatSensorValue", 30)
        .then((bool success) => data['heatSensorValue'] = 30);
    prefsTemp
        .setInt("heatSpeakerValue", 500)
        .then((bool success) => data['heatSpeakerValue'] = 500);
    prefsTemp
        .setBool("heatAuto", true)
        .then((bool success) => data['heatAuto'] = true);
    prefsTemp
        .setString("startTime", "07:00")
        .then((bool success) => data['startTime'] = "07:00");
    prefsTemp
        .setString("endTime", "09:00")
        .then((bool success) => data['endTime'] = "09:00");
    prefsTemp
        .setBool("pummerAuto", true)
        .then((bool success) => data['pummerAuto'] = true);
  } else {
    data['lightSensorValue'] = prefsTemp.getInt("lightSensorValue");
    data['lightColorVale'] = prefsTemp.getInt("lightColorVale");
    data['lightAuto'] = prefsTemp.getBool("lightAuto");
    data['heatSensorValue'] = prefsTemp.getInt("heatSensorValue");
    data['heatSpeakerValue'] = prefsTemp.getInt("heatSpeakerValue");
    data['heatAuto'] = prefsTemp.getBool("heatAuto");
    data['startTime'] = prefsTemp.getString("startTime");
    data['endTime'] = prefsTemp.getString("endTime");
    data['pummerAuto'] = prefsTemp.getBool("pummerAuto");
  }
  // print(data);
  updateSetting(data);
  //getChartData();
  //getChartDataDay('bk-iot-light');
  //getChartDataWeek("bk-iot-light");
  return data;
}

Future<void> updateSetting(Map<String, dynamic> data) async {
  final client = RetryClient(http.Client());
  try {
    var urlLight = Uri.parse(api_url + '/set_light_sensor');
    var responseLight = await http.post(urlLight, body: {
      'device': 'bk-iot-led',
      'auto': data['lightAuto'].toString(),
      'led_color': data['lightColorVale'].toString(),
      'value': data['lightSensorValue'].toString()
    });
    //print('Response Light status: ${responseLight.statusCode}');
    //print('Response Light body: ${responseLight.body}');
    var urlTem = Uri.parse(api_url + '/set_temp_sensor');
    var responseTem = await http.post(urlTem, body: {
      'device': 'bk-iot-speaker',
      'auto': data['heatAuto'].toString(),
      'speaker_value': data['heatSpeakerValue'].toString(),
      'value': data['heatSensorValue'].toString()
    });
    //print('Response Temp status: ${responseTem.statusCode}');
    //print('Response Temp body: ${responseTem.body}');
    var urlHumid = Uri.parse(api_url + '/set_humid_sensor');
    var responseHumid = await http.post(urlHumid, body: {
      'device': 'bk-iot-relay',
      'auto': data['pummerAuto'].toString(),
      'value': data['startTime'] + "-" + data['endTime']
    });
    //print('Response Temp status: ${responseHumid.statusCode}');
    //print('Response Temp body: ${responseHumid.body}');
  } finally {
    client.close();
  }
}

Future<void> updateLightSetting() async {
  SharedPreferences prefsTemp = await prefs;
  final client = RetryClient(http.Client());
  try {
    var urlLight = Uri.parse(api_url + '/set_light_sensor');
    var responseLight = await http.post(urlLight, body: {
      'device': 'bk-iot-led',
      'auto': prefsTemp.getBool('lightAuto').toString(),
      'led_color': prefsTemp.getInt("lightColorVale").toString(),
      'value': prefsTemp.getInt('lightSensorValue').toString()
    });
    print('Response Light status: ${responseLight.statusCode}');
    print('Response Light body: ${responseLight.body}');
  } finally {
    client.close();
  }
}

Future<void> updateHeatSetting() async {
  SharedPreferences prefsTemp = await prefs;
  final client = RetryClient(http.Client());
  try {
    var urlTem = Uri.parse(api_url + '/set_temp_sensor');
    var responseTem = await http.post(urlTem, body: {
      'device': 'bk-iot-speaker',
      'auto': prefsTemp.getBool('heatAuto').toString(),
      'speaker_value': prefsTemp.getInt("heatSpeakerValue").toString(),
      'value': prefsTemp.getInt('heatSensorValue').toString()
    });
    print('Response Temp status: ${responseTem.statusCode}');
    print('Response Temp body: ${responseTem.body}');
  } finally {
    client.close();
  }
}

Future<void> updateWatterSetting() async {
  SharedPreferences prefsWatter = await prefs;
  final client = RetryClient(http.Client());
  try {
    var urlHumid = Uri.parse(api_url + '/set_humid_sensor');
    var responseHumid = await http.post(urlHumid, body: {
      'device': 'bk-iot-relay',
      'auto': prefsWatter.getBool('pummerAuto').toString(),
      'value': prefsWatter.getString('startTime') +
          "-" +
          prefsWatter.getString('endTime')
    });
    print('Response Humid status: ${responseHumid.statusCode}');
    print('Response Humid body: ${responseHumid.body}');
  } finally {
    client.close();
  }
}
