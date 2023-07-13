import 'package:component_example/providers/banks_provider.dart';
import 'package:component_example/providers/selected_user_provider.dart';
import 'package:component_example/providers/users_provider.dart';
import 'package:flutter/material.dart';

import 'package:component_example/screens/user_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BankUserComponent extends HookConsumerWidget {
  const BankUserComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BanksNotifier banksNotifier = ref.watch(banksProvider);
    UserNotifier userNotifier = ref.watch(usersProvider);

    final selectedUser = ref.watch(selectedUserProvider);

    useMemoized(() {
      banksNotifier.fetchBankAccounts();
      return null;
    }, [banksNotifier.isFetchingBankList]);

    useMemoized(() {
      userNotifier.fetchUserList();
      return null;
    }, [userNotifier.isFetchingUserList]);

    if (banksNotifier.isFetchingBankList == true ||
        userNotifier.isFetchingUserList == true) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return WillPopScope(
        onWillPop: () async {
          if (selectedUser.name.isEmpty) {
            Navigator.pop(context);
          } else {
            context.pushNamed('bank transfer');
          }
          return false;
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('New component')),
          body: const UserList(),
        ),
      );
    }
  }
}
