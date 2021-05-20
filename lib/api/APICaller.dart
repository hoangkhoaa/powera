import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class APICaller {
  APICaller();
  final _api_address = 'http://128.199.24.44:5000';

  Future<bool> get_led_device(String _id) async {
    final client = RetryClient(http.Client());
    try {
      var url = Uri.parse(this._api_address + '/led/get?_id=' + _id);
      print(await client.read(url));
      return true;
    } finally {
      client.close();
    }
    return false;
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
