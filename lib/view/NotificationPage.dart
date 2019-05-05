import 'package:flutter/material.dart';

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class NotificationPage extends StatefulWidget {
  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<NotificationPage> {
  String msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知Notification'),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            msg += notification.msg + " ";
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () => MyNotification('Hi').dispatch(context),
                    child: Text('send notification'),
                  );
                },
              ),
              Text(msg)
            ],
          ),
        ),
      ),
    );
  }
}
