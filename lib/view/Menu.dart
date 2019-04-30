import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  static GlobalKey<ScaffoldState> globalKey = new GlobalKey();
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MenuPage> with SingleTickerProviderStateMixin {
  int selectedIndex = 1;

  TabController tabController;
  List tabs = ['新闻', '历史', '图片'];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onAdd() {}

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MenuPage.globalKey,
      appBar: AppBar(
        title: Text('昨日头条'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {
                // 打开抽屉菜单
                MenuPage.globalKey.currentState.openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
            controller: tabController,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList()),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {},
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAdd,
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.asset('assets/images/avatar.png', width: 80),
                    ),
                  ),
                  Text(
                    'Jack Ma',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text('Manage account'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
