import 'package:flutter/material.dart';
import 'package:component_example/model/bank_account.dart';
import 'package:component_example/data/banks.dart';
import 'package:component_example/model/user.dart';

import 'package:component_example/data/users.dart';
import 'package:component_example/screens/user_list.dart';

class BankUserComponent extends StatefulWidget {
  const BankUserComponent({super.key});

  @override
  State<BankUserComponent> createState() => _BankUserComponentState();
}

class _BankUserComponentState extends State<BankUserComponent> {
  final List<User> userList = createUserList();
  final List<BankAccount> banks = getBankAccounts();
  int selectedIndex = -1;

  void selectOption(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New component')),
      body: UserList(
        banks: banks,
        // selectedIndex: selectedIndex,
        // selectOption: selectOption,
        userList: userList,
      ),
    );
  }
}
