import 'package:flutter/material.dart';
import 'package:components/src/widgets_bank_user_component/bank_transfer_container_component.dart';
import 'package:components/src/widgets_bank_user_component/circular_bank_icon.dart';
import 'package:components/src/widgets_bank_user_component/circular_name_icon.dart';
// import 'package:components/src/extensions/extended_strings.dart';
import 'package:utils/utils.dart';

class BankTransferComponent extends StatelessWidget {
  const BankTransferComponent({
    super.key,
    required this.userName,
    required this.userAccountNumber,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankIcon,
    this.onTapBankComponent,
    this.trailingIconOnBankComponent,
    this.trailingIconOnUserComponent,
    this.onTapUserComponent,
  });

  final String userName;
  final String userAccountNumber;
  final String bankName;
  final String bankAccountNumber;
  final String bankIcon;
  final String? trailingIconOnBankComponent;
  final String? trailingIconOnUserComponent;

  final void Function()? onTapBankComponent;
  final void Function()? onTapUserComponent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          BankTransferContainerComponent(
            onTap: onTapBankComponent,
            title: bankName,
            subtitle: bankAccountNumber.displayAccountNumber(bankAccountNumber),
            icon: CircularBankIcon(
              bankIcon: bankIcon,
              size: IconSize.low,
            ),
            trailingIcon: trailingIconOnBankComponent,
          ),
          const SizedBox(width: 4),
          Container(
            width: 12,
            color: const Color.fromARGB(112, 158, 158, 158),
            height: 1,
          ),
          const SizedBox(width: 4),
          BankTransferContainerComponent(
            onTap: onTapUserComponent,
            title: userName,
            subtitle: userAccountNumber.displayAccountNumber(userAccountNumber),
            icon: CircularNameIcon(
              name: userName,
              size: IconSize.low,
            ),
            trailingIcon: trailingIconOnUserComponent,
          ),
        ],
      ),
    );
  }
}
