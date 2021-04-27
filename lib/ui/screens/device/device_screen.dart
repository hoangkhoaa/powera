import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/ui/components/app_bar.dart';
import 'package:powera/ui/screens/device/components/body.dart';
import 'package:powera/ui/components/bottom_nav_bar.dart';
import 'package:powera/bloc/power_button_bloc.dart';
import 'package:powera/ui/screens/device/components/graph.dart';
import 'package:powera/ui/components/drawer.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocProvider<PowerButtonBloc_Shape>(
          create: (context) => PowerButtonBloc_Shape(SomeGraph(
            color: Colors.amber,
            borderRadius: BorderRadius.zero,
          )),
          child: Body(),
        ),
        bottomNavigationBar: AnimatedBottomBar(),
        drawer: Drawer(
          child: CustomDashboard(),
        ),
        appBar: buildAppBar(context));
  }
}
