import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/constant/colors.dart';
import 'package:flutter_wanandroid/constant/dimens.dart';
import 'package:flutter_wanandroid/widget/border_circle_avatar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final double drawerWidth =
        MediaQueryData.fromWindow(window).size.width * 0.7;
    final double drawerHeaderHeight = drawerWidth * 0.4;
    return Container(
      width: drawerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  height: drawerHeaderHeight,
                  decoration: BoxDecoration(
                      color: AppColors.MAIN_COLORS,
                      image: DecorationImage(
                          alignment: Alignment.bottomRight,
                          image: Image.asset(
                            "resources/images/bili_drawerbg_logined.png",
                          ).image)),
                ),
                Positioned(
                  child: BorderShapeContainer(
                    CircleAvatar(
                      child: Image.asset("resources/images/def_user_icon.png"),
                    ),
                    border: Border.all(color: Colors.white, width: 1.0),
                    width: 45.0,
                    height: 45.0,
                  ),
                  left: 10.0,
                  top: 15.0,
                ),
                Positioned(
                  child: BorderShapeContainer(
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        "resources/images/ic_qrscan.png",
                        width: 13.0,
                        height: 13.0,
                      ),
                    ),
                    border: Border.all(color: Colors.white, width: 0.8),
                    width: 24.0,
                    height: 24.0,
                  ),
                  right: 15,
                  top: 15,
                ),
                Positioned(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("廖永强",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white)),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "管理员",
                              style: TextStyle(
                                  fontSize: 8.0, color: AppColors.MAIN_COLORS),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white60,
                              border:
                                  Border.all(color: Colors.white, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                            ),
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          ),
                        ],
                      )
                    ],
                  ),
                  left: 10,
                  bottom: 10,
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.collections,
            ),
            title: Text(
              "收藏",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Text("0", style: TextStyle(color: Colors.grey)),
            onTap: () {
                Fluttertoast.showToast(msg: "item onclick");
            },
          ),
          Divider(
            height: Dimens.DIVIDER_HEIGHT,
          )
        ],
      ),
    );
  }
}
