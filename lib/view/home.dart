import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../route-animation/FadeRoute.dart';

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
            RaisedButton(
              child: Text("原始指针事件"),
              onPressed: () => {navigateTo('event')},
            ),
            RaisedButton(
              child: Text("手势识别"),
              onPressed: () => {navigateTo('gesture')},
            ),
            RaisedButton(
              child: Text("注册事件"),
              onPressed: () => {navigateTo('onEvent')},
            ),
            RaisedButton(
              child: Text("触发事件"),
              onPressed: () => {navigateTo('emitEvent')},
            ),
            RaisedButton(
              child: Text("通知Notification"),
              onPressed: () => {navigateTo('notification')},
            ),
            RaisedButton(
              child: Text("Scale动画"),
              onPressed: () => {navigateTo('scaleAnimation')},
            ),
            RaisedButton(
              child: Text("Hero动画"),
              onPressed: () => {navigateTo('heroAnimation')},
            ),
            RaisedButton(
              child: Text("交错动画"),
              onPressed: () => {navigateTo('staggerAnimation')},
            ),
            RaisedButton(
              child: Text("自定义路由过渡动画"),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         transitionDuration: Duration(microseconds: 500),
                //         pageBuilder: (BuildContext context, Animation animation,
                //             Animation secondaryAnimation) {
                //           return FadeTransition(
                //             opacity: animation,
                //             child: Center(
                //               child: Container(
                //                 height: 200,
                //                 width: 200,
                //                 color: Colors.red,
                //               ),
                //             ),
                //           );
                //         }));
                Navigator.push(context, FadeRoute(builder: (context) {
                  return Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    ),
                  );
                }));
              },
            ),
            RaisedButton(
              child: Text("自定义Widget"),
              onPressed: () => {navigateTo('page')},
            ),
            RaisedButton(
              child: Text("CustomPaint和canvas"),
              onPressed: () => {navigateTo('chess')},
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
