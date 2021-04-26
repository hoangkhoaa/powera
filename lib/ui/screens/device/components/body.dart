import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/ui/screens/device/components/head_body.dart';
import 'package:powera/size_config.dart';
import 'attribute_card.dart';
import 'package:powera/bloc/power_button_bloc.dart';

import 'graph.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeHeader(),
            AttributeCard(),
            Expanded(child: Center(
              child: BlocBuilder<PowerButtonBloc, SomeGraph>(
                builder: (context, shape) {
                  return shape;
                },
              ),
            ))
          ],
        ));
  }
}
