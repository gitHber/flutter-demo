import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: Text('Button组件')),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'RaisedButton',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(
                '漂浮按钮，按下后阴影会变大',
              ),
              RaisedButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              Text(
                'FlatButton',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(
                '扁平按钮，按下后出现背景色',
              ),
              FlatButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              Text(
                'OutlineButton',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(
                '默认有一个边框',
              ),
              OutlineButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              Text(
                'IconButton',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(
                '可点击的Icon',
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => {},
              ),
              Text(
                '自定义',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(
                '样式配置',
              ),
              FlatButton(
                child: Text('Submit'),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () => {},
              ),
            ],
          ),
        ));
  }
}
