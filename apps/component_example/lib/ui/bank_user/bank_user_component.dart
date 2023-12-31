import 'package:component_example/ui/bank_user/providers/banks_provider.dart';
import 'package:component_example/ui/bank_user/providers/selected_user_provider.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:component_example/ui/bank_user/providers/users_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';

import 'package:component_example/ui/bank_user/widgets/user_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BankUserComponent extends HookConsumerWidget {
  const BankUserComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    BanksNotifier banksNotifier = ref.watch(banksProvider);
    UserNotifier userNotifier = ref.watch(usersProvider);

    final selectedUser = ref.watch(selectedUserProvider);

    useMemoized(() {
      banksNotifier.fetchBankAccounts();
      return null;
    }, [
      // banksNotifier.isFetchingBankList
    ]);

    useMemoized(() {
      userNotifier.fetchUserList();
      return null;
    }, [
      // userNotifier.isFetchingUserList
    ]);

    // if (banksNotifier.isFetchingBankList == true ||
    //     userNotifier.isFetchingUserList == true) {
    //   return const Center(child: CircularProgressIndicator());
    // } else {
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
        appBar: CustomAppBar(
          onBackButtonPress: () {
            if (selectedUser.name.isEmpty) {
              Navigator.pop(context);
            } else {
              context.pushNamed('bank transfer');
            }
          },
          title: 'Select Beneficiary',
          appTheme: theme,
        ),

        // AppBar(title: const Text('New component')),
        body: (banksNotifier.isFetchingBankList ||
                userNotifier.isFetchingUserList)
            ? const Center(child: CircularProgressIndicator())
            : const UserList(),
      ),
    );
    // }
  }
}
