import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  @override
  _SwitchAndCheckBoxState createState() => _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool switchSelected = true;
  bool checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: Text('Button组件')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Switch(
              value: switchSelected,
              onChanged: (value) {
                setState(() {
                  switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: checkboxSelected,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  checkboxSelected = value;
                });
              },
            )
          ],
        ));
  }
}
