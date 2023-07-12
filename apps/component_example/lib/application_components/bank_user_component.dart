import 'package:component_example/providers/banks_provider.dart';
import 'package:component_example/providers/selected_user_provider.dart';
import 'package:component_example/providers/users_provider.dart';
// import 'package:component_example/screens/bank_transfer_screen.dart';
import 'package:flutter/material.dart';
// import 'package:component_example/model/bank_account.dart';
// import 'package:component_example/data/banks.dart';
// import 'package:component_example/model/user.dart';

// import 'package:component_example/data/users.dart';
import 'package:component_example/screens/user_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BankUserComponent extends ConsumerStatefulWidget {
  const BankUserComponent({super.key});

  @override
  ConsumerState<BankUserComponent> createState() => _BankUserComponentState();
}

class _BankUserComponentState extends ConsumerState<BankUserComponent> {
  // final List<User> userList = createUserList();
  // final List<BankAccount> banks = getBankAccounts();
  UserNotifier? _userNotifier;
  BanksNotifier? _banksNotifier;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _userNotifier = ref.watch(usersProvider);
      _banksNotifier = ref.watch(banksProvider);
      _banksNotifier!.fetchBankAccounts();
      _userNotifier!.fetchUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // BanksNotifier banksNotifier = ref.watch(banksProvider);
    // UserNotifier userNotifier = ref.watch(usersProvider);
    // banksNotifier.fetchBankAccounts();
    // userNotifier.fetchUserList();

    if (_banksNotifier == null || _userNotifier == null) {
      return const CircularProgressIndicator();
    }

    final selectedUser = ref.watch(selectedUserProvider);

    if (_banksNotifier!.isFetchingBankList == true ||
        _userNotifier!.isFetchingUserList == true) {
      return const CircularProgressIndicator();
    } else {
      return WillPopScope(
        onWillPop: () async {
          if (selectedUser.name.isEmpty) {
            Navigator.pop(context);
          } else {
            context.pushNamed('bank transfer');
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return const BankTransferScreen(
            //         // selectedUser: selectedUser,
            //         // banks: banks,
            //         );
            //   },
            // ));
          }
          return false;
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('New component')),
          body: const UserList(
              // banks: banks,
              // userList: userList,
              ),
        ),
      );
    }
  }
}
