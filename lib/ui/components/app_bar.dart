import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';

AppBar buildAppBar(BuildContext context,
    {bool isTransparent = true, String title}) {
  Future<void> _showMyDialog() async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
          child: const Text('USER INFO',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: pTextColorGray2,
                  height: 0.5)),
        ),
        content: Container(
          height: getProportionateScreenHeight(170),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                  child: Image.asset(
                "assets/images/profile.jpg",
                height: getProportionateScreenHeight(90),
              )),
              VerticalSpacing(
                of: 20,
              ),
              Text(
                "ADMIN",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(17),
                    fontWeight: FontWeight.bold,
                    color: pTextColorGray3,
                    height: 1),
              ),
              VerticalSpacing(
                of: 20,
              ),
              Text(
                "Email: Admindeptrai@gmail.com",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold,
                    color: pTextColorGray2,
                    height: 1),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          TextButton(
            onPressed: () => Phoenix.rebirth(context),
            child: const Text(
              'Sign out',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
      Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: Text(
                          "Notification",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(17),
                              fontWeight: FontWeight.bold,
                              color: pTextColorGray3,
                              height: 1),
                        )));
              },
              icon: Icon(
                Icons.notifications_outlined,
                color: pItemColorChose,
                size: 30,
              ),
            ),
            Positioned(
              left: 27.0,
              bottom: 27,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  "0",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
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
