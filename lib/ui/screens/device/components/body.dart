import 'package:flutter/material.dart';
import 'package:powera/ui/screens/device/components/head_body.dart';
import 'package:powera/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            HomeHeader(),
            VerticalSpacing(),
            VerticalSpacing(),
            VerticalSpacing(),
          ],
        ),
      ),
    );
  }
}
