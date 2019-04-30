import 'package:flutter/material.dart';

class WillPopScopePage extends StatefulWidget {
  @override
  WillPopScopeState createState() => WillPopScopeState();
}

class WillPopScopeState extends State<WillPopScopePage> {
  DateTime lastPressTime; // 上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航返回拦截'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if(lastPressTime == null || DateTime.now().difference(lastPressTime) > Duration(seconds: 1)){
            lastPressTime = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text('1秒内连续两次返回键推出'),
        ),
      )
    );
  }
}
