import 'package:flutter/material.dart';
import '../components/LeftDrawer.dart';
import './DaySchedule.dart';
import './RecentSchedule.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _Counter createState() => _Counter();
}

class _Counter extends State<HomePage> {
  int selectIndex = 1;
  List<Widget> pages = <Widget>[DaySchedule(), RecentSchedule()];

  void onItemChange(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void navigateToWeb() {
    Navigator.pushNamed(context, 'web_blog');
  }

  void navigateTo(url) {
    Navigator.pushNamed(context, url);
  }

  @override
  Widget build(BuildContext context) {
    print(widget);
    return Scaffold(
      appBar: AppBar(
        title: Text('日程表'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: LeftDrawer(),
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.today), title: Text('当日计划')),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), title: Text('近期计划'))
        ],
        currentIndex: selectIndex,
        fixedColor: Colors.blue,
        onTap: onItemChange,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToWeb,
        tooltip: '个人主页',
        child: Icon(Icons.language),
      ),
    );
  }
}
