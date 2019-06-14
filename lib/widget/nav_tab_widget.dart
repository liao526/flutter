import 'package:flutter/material.dart';

enum NavigationAlignment { TOP, BOTTOM }

class NavigationWidget extends StatefulWidget {
  NavigationWidget(
    this.alignment, {
    Key key,
    this.tabItems,
    this.tabViews,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.pageController,
    Color bgColor,
    Color indicatorColor,
  })  : this.bgColor = bgColor ?? Colors.white,
        this.indicatorColor = indicatorColor ?? Colors.black,
        super(key: key);

  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color bgColor;
  final Color indicatorColor;
  final Widget title;
  final Widget drawer;
  final Widget floatingActionButton;
  final PageController pageController;
  final NavigationAlignment alignment;



  @override
  State<StatefulWidget> createState() {
    return NavigationWidgetState();
  }
}

class NavigationWidgetState extends State<NavigationWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, length: widget.tabItems.length);
  }

  @override
  Widget build(BuildContext context) {
    ///顶部TAbBar模式
    if (widget.alignment == NavigationAlignment.TOP) {
      return Scaffold(
        ///设置侧边滑出 drawer，不需要可以不设置
        drawer: widget.drawer,

        ///设置悬浮按键，不需要可以不设置
        floatingActionButton: widget.floatingActionButton,

        ///标题栏
        appBar: AppBar(
          backgroundColor: widget.bgColor,
          title: widget.title,

          ///tabBar控件
          bottom: TabBar(
            ///顶部时，tabBar为可以滑动的模式
            isScrollable: true,

            ///必须有的控制器，与pageView的控制器同步
            controller: _tabController,

            ///每一个tab item，是一个List<Widget>
            tabs: widget.tabItems,

            ///tab底部选中条颜色
            indicatorColor: widget.indicatorColor,
          ),
        ),

        ///页面主体，PageView，用于承载Tab对应的页面
        body: PageView(
          ///必须有的控制器，与tabBar的控制器同步
          controller: widget.pageController,

          ///每一个 tab 对应的页面主体，是一个List<Widget>
          children: widget.tabViews,

          ///页面触摸作用滑动回调，用于同步tab选中状态
          onPageChanged: (index) {
            _tabController.animateTo(index);
          },
        ),
      );
    }

    ///底部TAbBar模式
    return new Scaffold(

        ///设置侧边滑出 drawer，不需要可以不设置
        drawer: widget.drawer,

        ///设置悬浮按键，不需要可以不设置
        floatingActionButton: widget.floatingActionButton,

        ///标题栏
        appBar: AppBar(
          backgroundColor: widget.bgColor,
          title: widget.title,
        ),

        ///页面主体，PageView，用于承载Tab对应的页面
        body: PageView(
          ///必须有的控制器，与tabBar的控制器同步
          controller: widget.pageController,

          ///每一个 tab 对应的页面主体，是一个List<Widget>
          children: widget.tabViews,
          onPageChanged: (index) {
            ///页面触摸作用滑动回调，用于同步tab选中状态
            _tabController.animateTo(index);
          },
        ),

        ///底部导航栏，也就是tab栏
        bottomNavigationBar: Material(
          color: widget.bgColor,

          ///tabBar控件
          child: TabBar(
            ///必须有的控制器，与pageView的控制器同步
            controller: _tabController,

            ///每一个tab item，是一个List<Widget>
            tabs: widget.tabItems,

            ///tab底部选中条颜色
            indicatorColor: widget.indicatorColor,
          ),
        ));
  }
}
