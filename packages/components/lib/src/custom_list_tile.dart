// import 'package:bank_user_component/models/user.dart';
import 'package:flutter/material.dart';
// import 'package:bank_user_component/widgets/circular_name_icon.dart';
// import 'package:bank_user_component/widgets/circular_select_button.dart';
// import 'package:components/src/widgets_bank_user_component/circular_name_icon.dart';
import 'package:components/src/circular_select_button.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.isSelected,
    required this.index,
    required this.onTap,
    this.showTrailing = false,
    this.showLeading = true,
    required this.leadingIcon,
    this.contentPadding = const EdgeInsets.fromLTRB(24, 8, 24, 8),
    this.showBorder = false,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.borderRadius = 8,
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  final String title;

  final String? subtitle;
  final bool isSelected;
  final int index;
  final void Function() onTap;
  final bool showTrailing;
  final bool showLeading;
  final Widget leadingIcon;
  final EdgeInsetsGeometry contentPadding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: showBorder
          ? BoxDecoration(
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            )
          : null,
      child: ListTile(
        contentPadding: contentPadding,

        // tileColor:
        //     isSelected ? Theme.of(context).colorScheme.secondaryContainer : null,
        onTap: onTap,
        // Icon Component
        leading: showLeading ? leadingIcon : null,
        // Text Component
        title: Padding(
          padding: EdgeInsets.only(bottom: subtitle != null ? 4 : 0),
          child: Text(
            title,
            style:
                titleTextStyle ?? const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // subtitle component
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: subtitleTextStyle ??
                    const TextStyle(color: Color.fromARGB(101, 0, 0, 0)),
              )
            : null,
        // Radio button component
        trailing:
            showTrailing ? CircularSelectButton(isSelected: isSelected) : null,
      ),
    );
  }
}
