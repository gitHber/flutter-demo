import 'package:flutter/material.dart';

class ScrollListenerPage extends StatefulWidget {
  @override
  ScrollListenerState createState() => ScrollListenerState();
}

class ScrollListenerState extends State<ScrollListenerPage> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
  String _progress = '0%'; // 保存进度百分比

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动监听及控制ScrollController'),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print('bottomEdge: ${notification.metrics.extentAfter == 0}');
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              controller: _controller,
              itemCount: 100,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
            ),
            CircleAvatar(
              backgroundColor: Colors.black54,
              radius: 30,
              child: Text(_progress),
            )
          ],
        ),
      )),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
            ),
    );
  }
}
