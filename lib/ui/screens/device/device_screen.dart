import 'package:flutter/material.dart';
import 'package:powera/ui/components/app_bar.dart';
import 'package:powera/ui/screens/device/components/body.dart';
import 'package:powera/ui/components/bottom_nav_bar.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Body(),
        bottomNavigationBar: AnimatedBottomBar(),
        drawer: Drawer(
            child: SafeArea(
          child: Text("sdasd"),
        )),
        appBar: buildAppBar(context));
  }
}
