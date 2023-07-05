// import 'package:bank_user_component/extensions/extended_strings.dart';
// import 'package:bank_user_component/models/bank_account.dart';
// import 'package:bank_user_component/models/user.dart';
// import 'package:bank_user_component/widgets/bank_transfer_container_component.dart';
// import 'package:bank_user_component/widgets/circular_bank_icon.dart';
// import 'package:bank_user_component/widgets/circular_name_icon.dart';
import 'package:flutter/material.dart';
import 'package:components/src/widgets_bank_user_component/bank_transfer_container_component.dart';
import 'package:components/src/widgets_bank_user_component/circular_bank_icon.dart';
import 'package:components/src/widgets_bank_user_component/circular_name_icon.dart';
import 'package:components/src/extensions/extended_strings.dart';

class BankTransferComponent extends StatelessWidget {
  const BankTransferComponent({
    super.key,
    // required this.user,
    // required this.banks,
    // required this.defaultBankAccount,
    required this.userName,
    required this.userAccountNumber,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankIcon,
    required this.openBankListModal,
  });

  final String userName;
  final String userAccountNumber;
  final String bankName;
  final String bankAccountNumber;
  final String bankIcon;

  final void Function() openBankListModal;

  // final User user;
  // final List<BankAccount> banks;
  // final BankAccount defaultBankAccount;
  // late String displayAccountNumber =
  //     '*${defaultBankAccount.accountNumber.substring(defaultBankAccount.accountNumber.length - 4)}';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          BankTransferContainerComponent(
            onTap: openBankListModal,
            title: bankName,
            subtitle: bankAccountNumber.displayAccountNumber(bankAccountNumber),
            icon: CircularBankIcon(
              bankIcon: bankIcon,
              size: 'low',
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 12,
            color: const Color.fromARGB(112, 158, 158, 158),
            height: 1,
          ),
          const SizedBox(width: 8),
          BankTransferContainerComponent(
            title: userName,
            subtitle: userAccountNumber.displayAccountNumber(userAccountNumber),
            icon: CircularNameIcon(
              name: userName,
              backgroundColor: Colors.red,
              size: 'low',
            ),
          ),
        ],
      ),
    );
  }
}
