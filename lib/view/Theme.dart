import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  @override
  ThemeState createState() => ThemeState();
}

class ThemeState extends State<ThemePage> {
  Color themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: themeColor,
          iconTheme: IconThemeData(color: themeColor)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('主题'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text('颜色跟随主题')
              ],
            ),
            Theme(
              data: themeData.copyWith(
                  iconTheme: themeData.iconTheme.copyWith(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text('颜色固定黑色')
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                themeColor =
                    themeColor == Colors.teal ? Colors.blue : Colors.teal;
              }),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
