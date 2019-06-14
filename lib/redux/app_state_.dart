
import 'package:flutter_wanandroid/model/user.dart';
import 'package:flutter_wanandroid/redux/user_info_redux.dart';

class AppState {
  User user;
  AppState({this.user});
}

AppState addReducer(AppState state,action) {
  return AppState(user: userReducer(state.user,action));
}
