import 'package:flutter/material.dart';
import 'package:powera/constants.dart';

AppBar buildAppBar(BuildContext context,
    {bool isTransparent = true, String title}) {
  Future<void> _showMyDialog() async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: pItemColor,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
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
        onPressed: () {
          _showMyDialog();
        },
      )
    ],
  );
}
