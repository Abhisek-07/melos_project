import 'package:component_example/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedUserNotifier extends StateNotifier<User> {
  SelectedUserNotifier() : super(User.empty());

  void updateUser(User updatedUser) {
    state = updatedUser;
  }

  void clearUser() {
    state = User.empty();
  }
}

final selectedUserProvider = StateNotifierProvider<SelectedUserNotifier, User>(
    (ref) => SelectedUserNotifier());
