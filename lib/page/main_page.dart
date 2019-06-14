import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static final String routesName = "mainPage";

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> _pageChildren = [
    Center(
      child: Text("HOME"),
    ),
    Center(
      child: Text("PROJECT"),
    ),
    Center(
      child: Text("TREE"),
    ),
    Center(
      child: Text("MY"),
    ),
  ];

  static Widget _renderBottomTab(IconData icon, String title) {
    return Tab(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Colors.grey,
                size: 20.0,
              )),
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }

  List<Widget> _bottomTabs = [
    _renderBottomTab(Icons.home, "HOME"),
    _renderBottomTab(Icons.view_module, "PROJECT"),
    _renderBottomTab(Icons.book, "TREE"),
    _renderBottomTab(Icons.account_circle, "MY"),
  ];

  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: _bottomTabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pageChildren,
        onPageChanged: (index) {
          _tabController.animateTo(index);
        },
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Divider(
            height: 1,
          ),
          TabBar(
            controller: _tabController,
            tabs: _bottomTabs,
            onTap: (index) {
              _pageController.jumpTo(MediaQuery.of(context).size.width * index);
            },
          )
        ],
      ),
    );
  }
}
