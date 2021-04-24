import 'package:flutter/material.dart';
import 'package:powera/constants.dart';

AppBar buildAppBar(BuildContext context,
    {bool isTransparent = true, String title}) {
  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: pItemColor,
      ),
      onPressed: () {},
    ),
    title: !isTransparent
        ? Text(
            isTransparent ? "" : title,
            style: TextStyle(color: pTextColorGray3),
          )
        : null,
    centerTitle: true,
    actions: [
      IconButton(
        icon: ClipOval(
            child: Image.asset(
          "assets/images/profile.jpg",
        )),
        onPressed: () {},
      )
    ],
  );
}
