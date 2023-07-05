// import 'package:bank_user_component/models/bank_account.dart';
// import 'package:bank_user_component/models/user.dart';
// import 'package:bank_user_component/widgets/bank_transfer_component.dart';
import 'package:flutter/material.dart';
import 'package:component_example/model/bank_account.dart';
import 'package:component_example/model/user.dart';
import 'package:components/components.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen(
      {super.key, required this.user, required this.banks});

  final User user;
  final List<BankAccount> banks;

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  late BankAccount defaultAccount = getDefaultBankAccount();

  BankAccount getDefaultBankAccount() {
    BankAccount defaultAccount =
        widget.banks.firstWhere((account) => account.isDefault);
    return defaultAccount;
  }

  void openBankListModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('Your connected current accounts'),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.banks.length,
                  itemBuilder: (context, index) {
                    return Text(widget.banks[index].name);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Transfer'),
      ),
      body: BankTransferComponent(
        openBankListModal: openBankListModal,
        userName: widget.user.name,
        userAccountNumber: widget.user.accountNumber,
        bankName: defaultAccount.name,
        bankAccountNumber: defaultAccount.accountNumber,
        bankIcon: defaultAccount.icon,

        // user: widget.user,
        // banks: widget.banks,
        // defaultBankAccount: defaultAccount,
      ),
    );
  }
}
