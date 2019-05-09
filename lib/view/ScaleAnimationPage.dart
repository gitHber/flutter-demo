import 'package:flutter/material.dart';

// // 封装setState细节
// class AnimatedImage extends AnimatedWidget {
//   AnimatedImage({Key key, Animation<double> animation})
//       : super(key: key, listenable: animation);

//   @override
//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return Center(
//         child: Image.asset(
//       'assets/images/avatar.png',
//       width: animation.value,
//       height: animation.value,
//     ));
//   }
// }

class ScaleAnimationPage extends StatefulWidget {
  @override
  ScaleAnimationState createState() => ScaleAnimationState();
}

// 需要继承TickerProvider, 如果有多个AnimationController, 则应该使用TickerProviderStateMixin
class ScaleAnimationState extends State<ScaleAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    // 使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // 图片宽高由0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          // 动画结束反转执行动画
          controller.reverse();
        }else if(status == AnimationStatus.dismissed) {
          // 动画回复到初始状态是执行动画，正向
          controller.forward();
        }
      });
    // 启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedImage(animation: animation,);
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset('assets/images/avatar.png'),
      builder: (BuildContext ctx, Widget child) {
        return Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 销毁动画资源
    controller.dispose();
  }
}
