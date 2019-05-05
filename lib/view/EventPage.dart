import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  EventState createState() => EventState();
}

class EventState extends State<EventPage> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('原始点击事件'),
        ),
        body: Column(
          children: <Widget>[
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300,
                height: 150,
                child: Text(_event?.toString() ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              onPointerDown: (PointerDownEvent event) =>
                  setState(() => _event = event),
              onPointerMove: (PointerMoveEvent event) =>
                  setState(() => _event = event),
              onPointerCancel: (PointerCancelEvent event) =>
                  setState(() => _event = event),
              onPointerUp: (PointerUpEvent event) =>
                  setState(() => _event = event),
            ),
            Text('behavior有三种： deferToChild(子元素先捕获事件)，opaque(当前整个区域都是点击区域，不是只有可视区域)，translucent(点击事件可以穿透)'),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300,100)),
                child: Center(child: Text('Box A(宽度300,100)'),),
              ),
              onPointerDown: (event) => print('down A'),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300,100)),
                child: Center(child: Text('Box B(宽度300,100)'),),
              ),
              behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print('down B'),
            ),
            Stack(children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300,100)),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
                onPointerDown: (e) => print('down0'),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200,100)),
                  child: Center(child: Text('左上角200*100范围内非文本区域点击')),
                ),
                onPointerDown: (e) => print('down1'),
                behavior: HitTestBehavior.translucent,
              )
            ],)
          ],
        ));
  }
}
