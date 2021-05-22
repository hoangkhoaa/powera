import 'dart:convert';
import 'package:powera/model/example_db.dart';
import 'package:http/http.dart' as http;

Future<User> login(username, password) async {
  var url = Uri.parse( api_url + '/authenticate?username=admin&password=password');
  print(url.toString());
  var response = await http.post(url, body: {'username': username ,'password': password});
  print(response.body.toString());
  Map resData = jsonDecode(response.body);
  if (resData['error'] == false){
    String name = resData['name'];
    String role = resData['role'];
    String private_key = resData['private_key'];
    return User(username: username, name: name,role: role, private_key: private_key);
  }
  else {
    return null;
  }
}

Future<User> getCurrentUser() async {
  String username = await storage.read(key: 'username');
  String name = await storage.read(key: 'name');
  String private_key = await storage.read(key: 'private_key');
  String role = await storage.read(key: 'role');
}

class User {
  final username;
  final name;
  final role;
  final private_key;
  User({this.username, this.name, this.role, this.private_key});
}
