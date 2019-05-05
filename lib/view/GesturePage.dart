import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GesturePage extends StatefulWidget {
  @override
  GestureState createState() => GestureState();
}

class GestureState extends State<GesturePage> {

  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
  bool toggle = false;
  String operation = 'No Gesture detected';
  double top = 0.0;
  double left = 0.0;
  double width = 100;

  void updateText(String text) {
    setState(() {
      operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('手势识别'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200,
                  height: 100,
                  child: Text(operation, style: TextStyle(color: Colors.white)),
                ),
                onTap: () => updateText('Tap'),
                onDoubleTap: () => updateText('Double Tap'),
                onLongPress: () => updateText('Long Press'),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.loose(Size(300, 200)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: top,
                    left: left,
                    child: GestureDetector(
                      child: CircleAvatar(
                        child: Text('A'),
                      ),
                      // 手指按下的回调
                      onPanDown: (DragDownDetails e) {
                        print('用户手指按下：${e.globalPosition}');
                      },
                      // 手指滑动的回调
                      onPanUpdate: (DragUpdateDetails e) {
                        setState(() {
                          left += e.delta.dx;
                          top += e.delta.dy;
                        });
                      },
                      onPanEnd: (DragEndDetails e) {
                        print(e.velocity);
                      },
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: width,
                ),
                onScaleUpdate: (ScaleUpdateDetails e) {
                  setState(() {
                    width = 100 * e.scale.clamp(0.8, 5);
                  });
                },
              ),
            ),
            Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(text: '你好世界'),
                TextSpan(
                    text: '点我变色',
                    style: TextStyle(
                        fontSize: 30,
                        color: toggle ? Colors.blue : Colors.red
                    ),
                    recognizer: tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          toggle = !toggle;
                        });
                      }
                ),
                TextSpan(text: '你好世界'),
              ])),
            )
          ],
        ));
  }
}
