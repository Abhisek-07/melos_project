import 'package:component_example/providers/banks_provider.dart';
import 'package:component_example/providers/selected_user_provider.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:component_example/model/user.dart';
import 'package:components/components.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils/utils.dart';

class BankTransferScreen extends HookConsumerWidget {
  const BankTransferScreen({
    super.key,
  });

  void openBankListModal(BuildContext context, BanksNotifier banksNotifier) {
    showModalBottomSheet(
      constraints: BoxConstraints.loose(Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height * 0.52,
      )),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Your connected current accounts',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: banksNotifier.bankAccounts.length,
                  itemBuilder: (context, index) {
                    final bank = banksNotifier.bankAccounts[index];
                    final isSelected = bank.isDefault;
                    return CustomListTile(
                      title:
                          '${bank.name} - ${bank.money.addRuppeIcon(bank.money)}',
                      subtitle: '${bank.accountNumber} / ${bank.ifsc}',
                      isSelected: isSelected,
                      index: index,
                      onTap: () {
                        banksNotifier.updateDefaultAccount(index);
                        Navigator.of(context).pop();
                      },
                      leadingIcon: CircularBankIcon(bankIcon: bank.icon),
                      showTrailing: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      showBorder: isSelected,
                      borderColor: const Color.fromARGB(88, 158, 158, 158),
                      borderRadius: 8,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void openUserList(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeNotifier themeNotifier = ref.watch(themeProvider);
    BanksNotifier banksNotifier = ref.watch(banksProvider);

    User selectedUser = ref.read(selectedUserProvider);

    return WillPopScope(
      onWillPop: () async {
        ref.read(selectedUserProvider.notifier).clearUser();
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          onBackButtonPress: () {
            ref.read(selectedUserProvider.notifier).clearUser();
            Navigator.pop(context);
          },
          title: 'Bank Transfer',
          appTheme: themeNotifier.theme,
        ),
        // AppBar(
        //   title: const Text('Bank Transfer'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (banksNotifier.isFetchingDefaultAccount)
                const CircularProgressIndicator()
              else
                BankTransferComponent(
                  onTapBankComponent: () {
                    openBankListModal(context, banksNotifier);
                  },
                  userName: selectedUser.name,
                  userAccountNumber: selectedUser.accountNumber,
                  bankName: banksNotifier.defaultAccount.name,
                  bankAccountNumber: banksNotifier.defaultAccount.accountNumber,
                  bankIcon: banksNotifier.defaultAccount.icon,
                  trailingIconOnBankComponent: 'assets/icons/more.svg',
                  onTapUserComponent: () {
                    openUserList(context);
                  },
                ),
              if (banksNotifier.isFetchingDefaultAccount)
                const CircularProgressIndicator()
              else
                CustomElevatedButton(
                  appTheme: themeNotifier.theme,
                  onPressed: () {
                    context.pushNamed(
                      'preview screen',
                      // extra: BankTransferComponent(
                      //   userName: selectedUser.name,
                      //   userAccountNumber: selectedUser.accountNumber,
                      //   bankName: banksNotifier.defaultAccount.name,
                      //   bankAccountNumber:
                      //       banksNotifier.defaultAccount.accountNumber,
                      //   bankIcon: banksNotifier.defaultAccount.icon,
                      // ),
                    );
                  },
                  title: 'Preview',
                )
            ],
          ),
        ),
      ),
    );
  }
}
