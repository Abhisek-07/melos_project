import 'package:flutter/material.dart';
import 'package:components/src/widgets_bank_user_component/bank_transfer_container_component.dart';
import 'package:components/src/widgets_bank_user_component/circular_bank_icon.dart';
import 'package:components/src/widgets_bank_user_component/circular_name_icon.dart';
import 'package:components/src/extensions/extended_strings.dart';

class BankTransferComponent extends StatelessWidget {
  const BankTransferComponent({
    super.key,
    required this.userName,
    required this.userAccountNumber,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankIcon,
    this.openBankListModal,
    this.showTrailingIconOnBankComponent = false,
  });

  final String userName;
  final String userAccountNumber;
  final String bankName;
  final String bankAccountNumber;
  final String bankIcon;
  final bool showTrailingIconOnBankComponent;

  final void Function()? openBankListModal;

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
              size: CircularBankIconSize.low,
            ),
            showTrailingIcon: showTrailingIconOnBankComponent,
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
              size: CircularNameIconSize.low,
            ),
          ),
        ],
      ),
    );
  }
}
