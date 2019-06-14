import 'package:flutter_wanandroid/model/user.dart';
import 'package:flutter_wanandroid/redux/app_state_.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateUser),
]);

User _updateUser(User user, action) {
  return action.user;
}

class UpdateUserAction {
  final User user;

  UpdateUserAction(this.user);
}

class FetchUserAction {}

final List<Middleware<AppState>> middleware = [
  UserInfoMiddleware(),
];

class UserInfoMiddleware implements MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if (action is UpdateUserAction) {
      print("UserInfoMiddleware ");
    }
    next(action);
  }
}
