import 'package:component_example/model/user.dart';
import 'package:component_example/providers/banks_provider.dart';
import 'package:component_example/providers/selected_user_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreviewScreen extends HookConsumerWidget {
  const PreviewScreen({
    super.key,
    // required this.bankTransferComponent,
  });

  // final BankTransferComponent bankTransferComponent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User selectedUser = ref.watch(selectedUserProvider);
    BanksNotifier banksNotifier = ref.watch(banksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BankTransferComponent(
              userName: selectedUser.name,
              userAccountNumber: selectedUser.accountNumber,
              bankName: banksNotifier.defaultAccount.name,
              bankAccountNumber: banksNotifier.defaultAccount.accountNumber,
              bankIcon: banksNotifier.defaultAccount.icon,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomElevatedButton(
              onPressed: () {
                context.pushNamed('payment categories');
              },
              title: 'Choose payment category',
            ),
          ],
        ),
      ),
    );
  }
}
