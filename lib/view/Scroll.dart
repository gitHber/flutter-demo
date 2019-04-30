import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  @override
  ScrollState createState() => ScrollState();
}

class ScrollState extends State<ScrollPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List tabs = ['SingleChildScroll', 'List', 'Grid', 'CustomScroll'];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('滚动Widget'),
          bottom: TabBar(
              controller: tabController,
              tabs: tabs
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList()),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            SingleChildTab(),
            ListTab(),
            GridTab(),
            CustomTab()
          ],
        ));
  }
}

// SingleChild
class SingleChildTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(color: Colors.green[100], height: 50),
            Container(color: Colors.green[200], height: 50),
            Container(color: Colors.green[300], height: 50),
            Container(color: Colors.green[400], height: 50),
            Container(color: Colors.green[500], height: 50),
            Container(color: Colors.green[600], height: 50),
            Container(color: Colors.green[700], height: 50),
            Container(color: Colors.green[800], height: 50),
            Container(color: Colors.green[900], height: 50),
            Container(color: Colors.blue[100], height: 50),
            Container(color: Colors.blue[200], height: 50),
            Container(color: Colors.blue[300], height: 50),
            Container(color: Colors.blue[400], height: 50),
            Container(color: Colors.blue[500], height: 50),
            Container(color: Colors.blue[600], height: 50),
            Container(color: Colors.blue[700], height: 50),
            Container(color: Colors.blue[800], height: 50),
            Container(color: Colors.blue[900], height: 50),
          ],
        ),
      ),
    );
  }
}

// ListView
class ListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        reverse: true,
        children: <Widget>[
          Container(color: Colors.red[100], height: 50),
          Container(color: Colors.red[200], height: 50),
          Container(color: Colors.red[300], height: 50),
          Container(color: Colors.red[400], height: 50),
          Container(color: Colors.red[500], height: 50),
          Container(color: Colors.red[600], height: 50),
          Container(color: Colors.red[700], height: 50),
          Container(color: Colors.red[800], height: 50),
          Container(color: Colors.red[900], height: 50),
          Container(color: Colors.blue[100], height: 50),
          Container(color: Colors.blue[200], height: 50),
          Container(color: Colors.blue[300], height: 50),
          Container(color: Colors.blue[400], height: 50),
          Container(color: Colors.blue[500], height: 50),
          Container(color: Colors.blue[600], height: 50),
          Container(color: Colors.blue[700], height: 50),
          Container(color: Colors.blue[800], height: 50),
          Container(color: Colors.blue[900], height: 50),
        ],
      ),
    );
  }
}

// GridView
class GridTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 横轴9个子元素
            mainAxisSpacing: 0, // 行距
            crossAxisSpacing: 0, // 列距
            childAspectRatio: 1 // 子元素长宽比
            ),
        children: <Widget>[
          Container(color: Colors.red[100]),
          Container(color: Colors.red[200]),
          Container(color: Colors.red[300]),
          Container(color: Colors.red[400]),
          Container(color: Colors.red[500]),
          Container(color: Colors.red[600]),
          Container(color: Colors.red[700]),
          Container(color: Colors.red[800]),
          Container(color: Colors.red[900]),
          Container(color: Colors.blue[100]),
          Container(color: Colors.blue[200]),
          Container(color: Colors.blue[300]),
          Container(color: Colors.blue[400]),
          Container(color: Colors.blue[500]),
          Container(color: Colors.blue[600]),
          Container(color: Colors.blue[700]),
          Container(color: Colors.blue[800]),
          Container(color: Colors.blue[900]),
        ],
      ),
    );
  }
}

// CustomScrollView
class CustomTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
            background:
                Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ),
        SliverFixedExtentList(itemExtent: 50,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index){
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 *(index % 9)],
              child: Text('list item $index'),
            );
          },
          childCount: 50
        ),)
      ],
    );
  }
}
