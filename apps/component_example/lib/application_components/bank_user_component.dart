import 'package:component_example/providers/selected_user_provider.dart';
import 'package:component_example/screens/bank_transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:component_example/model/bank_account.dart';
import 'package:component_example/data/banks.dart';
import 'package:component_example/model/user.dart';

import 'package:component_example/data/users.dart';
import 'package:component_example/screens/user_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BankUserComponent extends ConsumerStatefulWidget {
  const BankUserComponent({super.key});

  @override
  ConsumerState<BankUserComponent> createState() => _BankUserComponentState();
}

class _BankUserComponentState extends ConsumerState<BankUserComponent> {
  final List<User> userList = createUserList();
  final List<BankAccount> banks = getBankAccounts();
  // int selectedIndex = -1;

  // void selectOption(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final selectedUser = ref.watch(selectedUserProvider);
    return WillPopScope(
      onWillPop: () async {
        if (selectedUser.name.isEmpty) {
          Navigator.pop(context);
        } else {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BankTransferScreen(
                selectedUser: selectedUser,
                banks: banks,
              );
            },
          ));
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('New component')),
        body: UserList(
          banks: banks,
          userList: userList,
        ),
      ),
    );
  }
}
