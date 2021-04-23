import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: build(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(),
    )
  } 
}