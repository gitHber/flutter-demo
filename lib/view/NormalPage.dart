import 'package:flutter/material.dart';
import '../components/GradientButton.dart';
import '../components/TurnBox.dart';
import '../components/GradientCircularProgressIndicator.dart';

class NormalPage extends StatefulWidget {
  @override
  NormalState createState() => NormalState();
}

class NormalState extends State<NormalPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  double turns = .0;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // 图片宽高由0变到300
    animation = new Tween(begin: 0.0, end: 0.8).animate(controller)
    ..addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          controller.reverse();
        } else {
          controller.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Widget'),
      ),
      body: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return GradientCircularProgressIndicator(
                colors: [Colors.teal, Colors.cyan],
                radius: 50.0,
                stokeWidth: 5.0,
                strokeCapRound: true,
                value: animation.value,
              );
            },
          ),
          GradientButton(
              child: Text('渐变'),
              width: 100,
              height: 50,
              colors: [Colors.red, Colors.orange[700]],
              onTap: () {
                print('tap');
              }),
          TurnBox(
            child: Icon(Icons.refresh),
            speed: 100,
            turns: turns,
          ),
          TurnBox(
            child: Icon(
              Icons.refresh,
              size: 50,
            ),
            speed: 500,
            turns: turns,
          ),
          RaisedButton(
            child: Text('旋转0.2'),
            onPressed: () {
              setState(() {
                turns += 0.2;
              });
            },
          ),
        ],
      ),
    );
  }
}
