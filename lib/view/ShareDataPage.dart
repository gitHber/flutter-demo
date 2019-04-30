import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);
  int data; // 需要在子树中共享的数据

  // 定义一个便捷方法，方便子树的Widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class TestWidget extends StatefulWidget {
  @override
  TextState createState() => TextState();
}

class TextState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      ShareDataWidget.of(context).data.toString(),
      style: TextStyle(decoration: TextDecoration.none),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('dependence changed');
  }
}

class ShareDataPage extends StatefulWidget {
  @override
  ShareDataPageState createState() => ShareDataPageState();
}

class ShareDataPageState extends State<ShareDataPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TestWidget(),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text('add'),
            )
          ],
        ),
      ),
    );
  }
}
