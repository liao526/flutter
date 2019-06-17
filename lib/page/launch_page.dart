import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/page/main_page.dart';

class LaunchPage extends StatelessWidget {
  static final String routesName = "/";

  void goMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, MainPage.routesName);
  }



 /// flutter_driver from sdk is forbidden.
///  So, because ninghao_flutter depends on flutter_driver any from sdk, version solving failed.
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1 * 2000), () => goMainPage(context));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: FlutterLogo(
              size: 110,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text("WAN ANDROID",
                style: TextStyle(fontSize: 14.0, letterSpacing: 2.0)),
          )
        ],
      ),
    );
  }
}
//}
