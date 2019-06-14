import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/page/launch_page.dart';
import 'package:flutter_wanandroid/page/main_page.dart';
import 'package:flutter_wanandroid/redux/app_state_.dart';
import 'package:flutter_wanandroid/redux/user_info_redux.dart';
import 'package:redux/redux.dart';
import 'model/user.dart';

void main() {
  ///全局异常捕获
  runZoned(() => runApp(App()), onError: (Object obj, StackTrace t) {
    print(obj);
    print(t);
  });
}

class App extends StatelessWidget {

  ///全局的状态保存
  final Store<AppState> store = Store<AppState>(addReducer,
      middleware: middleware, initialState: AppState(user: User.empty()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      routes: <String, WidgetBuilder>{
        LaunchPage.routesName: (context) => LaunchPage(),
        MainPage.routesName:(context)=> MainPage(),
      },
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
