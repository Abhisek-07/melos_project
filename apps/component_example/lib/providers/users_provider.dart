import 'dart:convert';

import 'package:component_example/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:component_example/data/users.dart';

class UserNotifier extends ChangeNotifier {
  List<User> userList = [];
  bool isFetchingUserList = true;

  void fetchUserList() async {
    // isFetchingUserList = true;
    // notifyListeners();
    userList = await createUserList();
    print(userList);
    isFetchingUserList = false;
    notifyListeners();
  }

  Future<List<User>> createUserList() async {
    final jsonData = await rootBundle.loadString('assets/bank_user.json');
    final jsonOptions = json.decode(jsonData);
    List<dynamic> list = jsonOptions['users'];
    final users = list.map((user) => User.fromJson(user)).toList();
    // await Future.delayed(const Duration(seconds: 2));

    return users;
  }

  List<User> get users => userList;
}

final usersProvider = ChangeNotifierProvider.autoDispose((ref) {
  return UserNotifier();
});
