import 'package:flutter/material.dart';

import 'border_circle_avatar.dart';

class MainTitleBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainTitleBarState();
  }
}

class MainTitleBarState extends State<MainTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          child: BorderShapeContainer(
            Image.asset("resources/images/top_bar_user_icon.png"),
          ),
          onTap: () => Scaffold.of(context).openDrawer(),
        )
      ],
    );
  }
}
