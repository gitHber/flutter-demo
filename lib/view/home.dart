import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.initValue}) : super(key: key);

  final String title;
  final int initValue;

  @override
  _Counter createState() => _Counter();
}

class _Counter extends State<HomePage> {
  int counter = 0;
  bool active = false;

  void handleTapboxChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

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

  void navigateTo(url) {
    Navigator.pushNamed(context, url);
  }

  @override
  Widget build(BuildContext context) {
    print(widget);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          spacing: 8.0,
          children: <Widget>[
            RaisedButton(
              child: Text("Text"),
              onPressed: () => {navigateTo('Text')},
            ),
            RaisedButton(
              child: Text("Button"),
              onPressed: () => {navigateTo('Button')},
            ),
            RaisedButton(
              child: Text("图片和Icon"),
              onPressed: () => {navigateTo('Image')},
            ),
            RaisedButton(
              child: Text("Checkbox和Switch"),
              onPressed: () => {navigateTo('Checkbox')},
            ),
            RaisedButton(
              child: Text("输入框和表单"),
              onPressed: () => {navigateTo('TextField')},
            ),
            RaisedButton(
              child: Text("布局"),
              onPressed: () => {navigateTo('Layout')},
            ),
            RaisedButton(
              child: Text("Scaffold、TabBar、底部导航"),
              onPressed: () => {navigateTo('menu')},
            ),
            RaisedButton(
              child: Text("滚动Widget"),
              onPressed: () => {navigateTo('scroll')},
            ),
            RaisedButton(
              child: Text("滚动监听及控制ScrollController"),
              onPressed: () => {navigateTo('scrollListener')},
            ),
            RaisedButton(
              child: Text("导航返回拦截"),
              onPressed: () => {navigateTo('willPopScope')},
            ),
            RaisedButton(
              child: Text("数据共享"),
              onPressed: () => {navigateTo('shareData')},
            ),
            RaisedButton(
              child: Text("主题"),
              onPressed: () => {navigateTo('theme')},
            ),
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
