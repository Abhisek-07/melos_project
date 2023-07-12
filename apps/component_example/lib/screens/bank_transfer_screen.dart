// import 'package:bank_user_component/models/bank_account.dart';
// import 'package:bank_user_component/models/user.dart';
// import 'package:bank_user_component/widgets/bank_transfer_component.dart';
// import 'package:component_example/application_components/bank_user_component.dart';
// import 'dart:developer';

import 'package:component_example/providers/banks_provider.dart';
import 'package:component_example/providers/selected_user_provider.dart';
// import 'package:component_example/screens/preview_screen.dart';
import 'package:flutter/material.dart';
// import 'package:component_example/model/bank_account.dart';
import 'package:component_example/model/user.dart';
import 'package:components/components.dart';
import 'package:go_router/go_router.dart';
import 'package:utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BankTransferScreen extends ConsumerStatefulWidget {
  const BankTransferScreen({
    super.key,
    // required this.selectedUser,
    // required this.banks,
  });

  // final User selectedUser;
  // final List<BankAccount> banks;

  @override
  ConsumerState<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends ConsumerState<BankTransferScreen> {
  // late BankAccount defaultAccount = getDefaultBankAccount();

  // BankAccount getDefaultBankAccount() {

  //   BankAccount defaultAccount =
  //       widget.banks.firstWhere((account) => account.isDefault);
  //   return defaultAccount;
  // }

  // void updateDefaultAccount(int tappedIndex) {
  //   setState(() {
  //     for (int i = 0; i < widget.banks.length; i++) {
  //       if (i == tappedIndex) {
  //         widget.banks[i].isDefault = true;
  //         defaultAccount = widget.banks[i];
  //       } else {
  //         widget.banks[i].isDefault = false;
  //       }
  //     }
  //   });
  // }

  BanksNotifier? _banksNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _banksNotifier = ref.watch(banksProvider);
      _banksNotifier!.getDefaultBankAccount();
    });
  }

  void openBankListModal() {
    showModalBottomSheet(
      constraints: BoxConstraints.loose(Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height * 0.52,
      )),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        if (_banksNotifier == null) {
          return const CircularProgressIndicator();
        }

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
                  // itemCount: widget.banks.length,
                  itemCount: _banksNotifier!.bankAccounts.length,
                  itemBuilder: (context, index) {
                    // final bank = widget.banks[index];
                    final bank = _banksNotifier!.bankAccounts[index];
                    final isSelected = bank.isDefault;
                    return CustomListTile(
                      title:
                          '${bank.name} - ${bank.money.addRuppeIcon(bank.money)}',
                      subtitle: '${bank.accountNumber} / ${bank.ifsc}',
                      isSelected: isSelected,
                      index: index,
                      onTap: () {
                        // updateDefaultAccount(index);
                        _banksNotifier!.updateDefaultAccount(index);
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

  void openUserList() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    _banksNotifier = ref.watch(banksProvider);
    // log("building....");
    if (_banksNotifier == null) {
      return const CircularProgressIndicator();
    }

    User selectedUser = ref.read(selectedUserProvider);

    return WillPopScope(
      onWillPop: () async {
        ref.read(selectedUserProvider.notifier).clearUser();
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bank Transfer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_banksNotifier!.isFetchingDefaultAccount)
                const CircularProgressIndicator()
              else
                BankTransferComponent(
                  onTapBankComponent: () {
                    openBankListModal();
                  },
                  userName: selectedUser.name,
                  userAccountNumber: selectedUser.accountNumber,
                  bankName: _banksNotifier!.defaultAccount.name,
                  bankAccountNumber:
                      _banksNotifier!.defaultAccount.accountNumber,
                  bankIcon: _banksNotifier!.defaultAccount.icon,
                  trailingIconOnBankComponent: 'assets/icons/more.svg',
                  onTapUserComponent: () {
                    openUserList();
                  },
                ),
              if (_banksNotifier!.isFetchingDefaultAccount)
                const CircularProgressIndicator()
              else
                CustomElevatedButton(
                  onPressed: () {
                    context.push(
                      '/bank-user/bank-transfer/preview-screen',
                      extra: BankTransferComponent(
                        userName: selectedUser.name,
                        userAccountNumber: selectedUser.accountNumber,
                        bankName: _banksNotifier!.defaultAccount.name,
                        bankAccountNumber:
                            _banksNotifier!.defaultAccount.accountNumber,
                        bankIcon: _banksNotifier!.defaultAccount.icon,
                        // trailingIconOnUserComponent:
                        //     'assets/icons/downloads.svg',
                      ),
                    );

                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) {
                    //     return PreviewScreen(
                    //       bankTransferComponent: BankTransferComponent(
                    //         userName: selectedUser.name,
                    //         userAccountNumber: selectedUser.accountNumber,
                    //         bankName: banksNotifier.defaultAccount.name,
                    //         bankAccountNumber:
                    //             banksNotifier.defaultAccount.accountNumber,
                    //         bankIcon: banksNotifier.defaultAccount.icon,
                    //         // trailingIconOnUserComponent:
                    //         //     'assets/icons/downloads.svg',
                    //       ),
                    //     );
                    //   },
                    // ));
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
