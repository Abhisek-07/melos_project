// import 'package:bank_user_component/models/bank_account.dart';
// import 'package:bank_user_component/models/user.dart';
// import 'package:bank_user_component/widgets/bank_transfer_component.dart';
import 'package:component_example/application_components/bank_user_component.dart';
import 'package:component_example/screens/preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:component_example/model/bank_account.dart';
import 'package:component_example/model/user.dart';
import 'package:components/components.dart';
import 'package:utils/utils.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({
    super.key,
    required this.selectedUser,
    required this.banks,
  });

  final User selectedUser;
  final List<BankAccount> banks;

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  late BankAccount defaultAccount = getDefaultBankAccount();

  BankAccount getDefaultBankAccount() {
    // for (int i = 0; i < widget.banks.length; i++) {
    //   if (widget.banks[i].isDefault) {
    //     widget.banks[i].isDefault = false;
    //   }
    // }
    // widget.banks[0].isDefault = true;
    // BankAccount defaultAccount = widget.banks[0];

    BankAccount defaultAccount =
        widget.banks.firstWhere((account) => account.isDefault);
    return defaultAccount;
  }

  void updateDefaultAccount(int tappedIndex) {
    setState(() {
      for (int i = 0; i < widget.banks.length; i++) {
        if (i == tappedIndex) {
          widget.banks[i].isDefault = true;
          defaultAccount = widget.banks[i];
        } else {
          widget.banks[i].isDefault = false;
        }
      }
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
                  itemCount: widget.banks.length,
                  itemBuilder: (context, index) {
                    final bank = widget.banks[index];
                    final isSelected = bank.isDefault;
                    return CustomListTile(
                      title:
                          '${bank.name} - ${bank.money.addRuppeIcon(bank.money)}',
                      subtitle: '${bank.accountNumber} / ${bank.ifsc}',
                      isSelected: isSelected,
                      index: index,
                      onTap: () {
                        updateDefaultAccount(index);
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
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const BankUserComponent();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Transfer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BankTransferComponent(
              onTapBankComponent: () {
                openBankListModal();
              },
              userName: widget.selectedUser.name,
              userAccountNumber: widget.selectedUser.accountNumber,
              bankName: defaultAccount.name,
              bankAccountNumber: defaultAccount.accountNumber,
              bankIcon: defaultAccount.icon,
              trailingIconOnBankComponent: 'assets/icons/more.svg',
              onTapUserComponent: () {
                openUserList();
              },
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PreviewScreen(
                      bankTransferComponent: BankTransferComponent(
                        userName: widget.selectedUser.name,
                        userAccountNumber: widget.selectedUser.accountNumber,
                        bankName: defaultAccount.name,
                        bankAccountNumber: defaultAccount.accountNumber,
                        bankIcon: defaultAccount.icon,
                        // trailingIconOnUserComponent:
                        //     'assets/icons/downloads.svg',
                      ),
                    );
                  },
                ));
              },
              title: 'Preview',
            )
          ],
        ),
      ),
    );
  }
}
