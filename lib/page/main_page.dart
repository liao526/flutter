import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/module/my/my.dart';
import 'package:flutter_wanandroid/widget/border_circle_avatar.dart';

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
    // MyPage(),
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
    //  _renderBottomTab(Icons.account_circle, "MY"),
  ];

  __renderLeadingIcon() {
    return Builder(builder: (BuildContext context) {
      return InkWell(
        child: Center(
          child: Row(
            children: <Widget>[
              Icon(Icons.menu,size: 15,color: Colors.white,),
              Expanded(child: BorderShapeContainer(
                  CircleAvatar(
                    child: Image.asset("resources/images/def_user_icon.png"),
                  ),
                border: Border.all(color: Colors.white, width: 0.7),width: 35.0,height: 35.0,
              ),)
            ],
          ),
        ),
        onTap: () => Scaffold.of(context).openDrawer(),
      );
    });
  }

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
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyPage(),
      appBar: AppBar(
        leading: __renderLeadingIcon(),
        titleSpacing: 0.0,
        //       title: MainTitleBar(),
      ),
      body: PageView(
        controller: _pageController,
        children: _pageChildren,
        onPageChanged: (index) {
          _tabController.animateTo(index);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[100],
        child: TabBar(
          controller: _tabController,
          tabs: _bottomTabs,
          onTap: (index) {
            _pageController.jumpTo(MediaQuery.of(context).size.width * index);
          },
        ),
      ),
    );
  }
}
