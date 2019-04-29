import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
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
                'asset加载图片',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Image(
                image: AssetImage('assets/images/bg.jpg'),
                width: 100,
              ),
              Text(
                '网络图片',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Image(
                image: NetworkImage(
                    'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
                width: 100,
              ),
              Text(
                'Icon',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.accessible, color: Colors.green),
                  Icon(Icons.error, color: Colors.red),
                  Icon(Icons.fingerprint, color: Colors.blue),
                ],
              ),
            ],
          ),
        ));
  }
}
