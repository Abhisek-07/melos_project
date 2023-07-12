import 'package:component_example/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:component_example/data/users.dart';

class UserNotifier extends ChangeNotifier {
  final List<User> userList = createUserList();
}

final usersProvider = ChangeNotifierProvider((ref) {
  return UserNotifier();
});
