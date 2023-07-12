import 'package:component_example/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:component_example/data/users.dart';

class UserNotifier extends ChangeNotifier {
  List<User> userList = [];
  bool isFetchingUserList = true;

  void fetchUserList() {
    // isFetchingUserList = true;
    // notifyListeners();
    userList = createUserList();
    isFetchingUserList = false;
    notifyListeners();
  }

  List<User> get users => userList;
}

final usersProvider = ChangeNotifierProvider((ref) {
  return UserNotifier();
});
