import 'package:flutter/material.dart';
import './view/home.dart';
import './routes/routes.dart';

void main() => runApp(MyApp());  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '日程',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: routes,
      home: HomePage(title: '计数器',initValue: 10,)
    );
  }
}