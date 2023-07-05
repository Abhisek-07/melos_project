// import 'package:bank_user_component/models/user.dart';
import 'package:flutter/material.dart';
// import 'package:bank_user_component/widgets/circular_name_icon.dart';
// import 'package:bank_user_component/widgets/circular_select_button.dart';
import 'package:components/src/widgets_bank_user_component/circular_name_icon.dart';
import 'package:components/src/widgets_bank_user_component/circular_select_button.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.userName,
    required this.accountNumber,
    required this.ifsc,
    required this.isSelected,
    // required this.user,
    required this.index,
    required this.selectedOption,
    this.showTrailing = false,
    this.showLeading = true,
  });

  final String userName;
  final String accountNumber;
  final String ifsc;
  final bool isSelected;
  // final User user;
  final int index;
  final void Function(int) selectedOption;
  final bool showTrailing;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isSelected ? Colors.yellow : null,
      onTap: () {
        selectedOption(index);
      },
      // Icon Component
      leading: showLeading
          ? CircularNameIcon(
              name: userName,
              backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
            )
          : null,
      // Text Component
      title: Text(userName),
      // subtitle component
      subtitle: Text(accountNumber + '/' + ifsc),
      // Radio button component
      trailing:
          showTrailing ? CircularSelectButton(isSelected: isSelected) : null,
    );
  }
}
