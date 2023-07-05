// import 'package:bank_user_component/models/user.dart';
import 'package:flutter/material.dart';
// import 'package:bank_user_component/widgets/circular_name_icon.dart';
// import 'package:bank_user_component/widgets/circular_select_button.dart';
// import 'package:components/src/widgets_bank_user_component/circular_name_icon.dart';
import 'package:components/src/widgets_bank_user_component/circular_select_button.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.isSelected,
    required this.index,
    required this.selectedOption,
    this.showTrailing = false,
    this.showLeading = true,
    required this.leadingIcon,
  });

  final String title;

  final String? subtitle;
  final bool isSelected;
  final int index;
  final void Function(int) selectedOption;
  final bool showTrailing;
  final bool showLeading;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 8),

      // tileColor:
      //     isSelected ? Theme.of(context).colorScheme.secondaryContainer : null,
      onTap: () {
        selectedOption(index);
      },
      // Icon Component
      leading: showLeading ? leadingIcon : null,
      // Text Component
      title: Text(title),
      // subtitle component
      subtitle: subtitle != null ? Text(subtitle!) : null,
      // Radio button component
      trailing:
          showTrailing ? CircularSelectButton(isSelected: isSelected) : null,
    );
  }
}
