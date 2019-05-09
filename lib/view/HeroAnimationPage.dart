import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          child: Hero(
            tag: 'avatar', // 唯一标记，前后两个路由页面Hero的tag必须相同
            child: ClipOval(
              child: Image.asset('assets/images/avatar.png', width: 50),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                      appBar: AppBar(
                        title: Text('原图'),
                      ),
                      body: HeroAnimationB()));
            }));
          },
        ),
      ),
    );
  }
}

class HeroAnimationB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'avatar',
        child: ClipRect(
          child: Image.asset('assets/images/avatar.png', width: 200),
        ),
      ),
    );
  }
}
