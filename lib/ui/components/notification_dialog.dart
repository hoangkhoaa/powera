import 'package:flutter/material.dart';
import 'package:powera/notification_data.dart';

import '../../constants.dart';
import '../../size_config.dart';

class NotidicationDialog extends StatelessWidget {
  final Function function;
  NotidicationDialog({this.function});
  @override
  Widget build(BuildContext context) {
    Future<List<NotificationP>> listNoti = getNotification();
    return new AlertDialog(
      title: Center(
          child: Text(
        'Notification',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: pTextColorGray2,
            height: 0.5),
      )),
      content: FutureBuilder<List<NotificationP>>(
          future: listNoti,
          builder: (BuildContext context,
              AsyncSnapshot<List<NotificationP>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('error: ${snapshot.error}');
                } else {
                  return Container(
                    height: getProportionateScreenHeight(300),
                    width: getProportionateScreenWidth(300),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          int length = snapshot.data.length;
                          return ListTile(
                            title: NotificationItem(
                                snapshot.data[length - index - 1]),
                          );
                        }),
                  );
                }
            }
          }),
      actions: <Widget>[
        TextButton(
          child: const Text('Mark as all seen'),
          onPressed: () {
            function();
            checkNotification();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationP item;
  NotificationItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: getProportionateScreenWidth(200),
        decoration: BoxDecoration(
          color: Colors.white,
          border: item.isSeen
              ? Border.all(color: pTextColorGray3, width: 2)
              : Border.all(color: pItemOnColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.content,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold,
                    color: pTextColorGray2,
                    height: 1),
              ),
              VerticalSpacing(
                of: 5,
              ),
              Text(
                "Notify at: " + item.timeFormatted,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.normal,
                    color: pItemColor,
                    height: 1),
              )
            ],
          ),
        ));
  }
}
