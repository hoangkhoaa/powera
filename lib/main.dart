import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:powera/setting_saves.dart';
import 'package:powera/ui/screens/device/device_screen.dart';
import 'package:powera/ui/screens/login/LoginScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ButtonObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

void main() async {
  Bloc.observer = ButtonObserver();
  //checkSettingSave();
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travels App',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/DeviceScreen': (context) => DeviceScreen(),
      },
    );
  }
}
