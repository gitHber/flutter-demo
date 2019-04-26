import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Counter createState() => _Counter();
}

class _Counter extends State<HomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void navigateToWeb() {
    // Navigator.push(
    //     context,
    //     new MaterialPageRoute(
    //         builder: (_) => new WebviewScaffold(
    //               url: 'https://likun.fun',
    //               userAgent:
    //                   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36',
    //             ))
    // );
    // 提前注册路由
    Navigator.pushNamed(context, 'web_blog');
  }

  @override
  Widget build(BuildContext context) {
    print(widget);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$counter', style: Theme.of(context).textTheme.display1),
            RaisedButton(
              child: Icon(Icons.add),
              highlightColor: Colors.blue[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: increment,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToWeb,
        tooltip: '个人主页',
        child: Icon(Icons.language),
      ),
    );
  }
}
