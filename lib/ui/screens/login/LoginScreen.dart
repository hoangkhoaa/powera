import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/ui/screens/login/components/button_widget.dart';
import 'package:powera/ui/screens/login/components/textfield_widget.dart';
import 'package:powera/ui/screens/login/components/wave_widget.dart';
import 'package:powera/model/User.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../setting_saves.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final storage = new FlutterSecureStorage();

    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: Global.mediumBlue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Powera',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: 'Username',
                  obscureText: false,
                  prefixIconData: Icons.verified_user,
                  suffixIconData: Icons.check,
                  onChanged: (value) {
                    username = value;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText: 'Password',
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Global.mediumBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonWidget(
                  title: 'Login',
                  hasBorder: false,
                  function: () async {
                    User user = await login(username, password);
                    if (user == null) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Center(
                              child: Text(
                            "Authentication failed.",
                            textAlign: TextAlign.center,
                          )),
                        ),
                      );
                    } else {
                      await storage.write(
                          key: 'private_key', value: user.private_key);
                      await storage.write(
                          key: 'username', value: user.username);
                      await storage.write(key: 'name', value: user.name);
                      await storage.write(
                          key: 'private_key', value: user.private_key);
                      await storage.write(key: 'role', value: user.role);
                      Future<Map<String, dynamic>> initLocalData =
                          checkSettingSave();
                      Navigator.popAndPushNamed(context, '/DeviceScreen');
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(
                  title: 'Sign Up',
                  hasBorder: true,
                  function: () {
                    Navigator.popAndPushNamed(context, '/DeviceScreen');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
