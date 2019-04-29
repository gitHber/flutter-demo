import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: Text('Text组件')),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.none,
                color: Colors.black),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(TextSpan(
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                          text: '雨霖铃',
                          style:
                              TextStyle(color: Color.fromARGB(255, 204, 0, 0))),
                      TextSpan(text: '·'),
                      TextSpan(
                          text: '寒蝉凄切',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 204))),
                    ])),
                Text.rich(TextSpan(
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700, height: 2.0),
                    children: [
                      TextSpan(
                          text: '[作者]',
                          style: TextStyle(
                              color: Color.fromARGB(255, 153, 153, 153))),
                      TextSpan(
                          text: '柳永',
                          style: TextStyle(
                              color: Color.fromARGB(255, 38, 115, 219))),
                      TextSpan(text: '    '),
                      TextSpan(
                          text: '[朝代]',
                          style: TextStyle(
                              color: Color.fromARGB(255, 153, 153, 153))),
                      TextSpan(text: '宋'),
                    ])),
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 17,
                      height: 1.5,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 15, 15, 15)),
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('寒蝉凄切，对长亭晚，骤雨初歇。'),
                      Text('都门帐饮无绪，留恋处，兰舟催发。'),
                      Text('执手相看泪眼，竟无语凝噎。'),
                      Text('念去去，千里烟波，暮霭沉沉楚天阔。'),
                      Text('多情自古伤离别，更那堪，冷落清秋节！'),
                      Text('今宵酒醒何处？杨柳岸，晓风残月。'),
                      Text('此去经年，应是良辰好景虚设。'),
                      Text('便纵有千种风情，更与何人说？'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
