import 'package:flutter/material.dart';
import '../event/EventBus.dart';

class OnEventPage extends StatefulWidget {
  @override
  OnEventState createState() => OnEventState();
}

class OnEventState extends State<OnEventPage> {
  String msg = '注册事件';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册事件'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text(msg),
            onPressed: () {
              setState(() {
                msg = '已注册事件';
              });
              eventBus.on('login', (arg) {
                print('我是练习时长两年半的练习生$arg，喜欢唱跳、Rap、篮球');
              });
            },
          ),
        ));
  }
}
