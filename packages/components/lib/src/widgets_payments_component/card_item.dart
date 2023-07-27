import 'package:components/components.dart';
import 'package:utils/utils.dart';
import 'package:components/src/widgets_bank_user_component/circular_bank_icon.dart';
import 'package:flutter/material.dart';
// import 'package:utils/utils.dart';
// import '../../../../../apps/component_example/lib/model/option.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    // required this.optionIndex,
    // required this.selectedIndex,
    required this.selectOption,
    required this.cardName,
    required this.iconUrl,
    required this.selectedIconUrl,
    required this.iconGradientColors,
    required this.isSelected,
    required this.appTheme,
  });

  // final int optionIndex;
  // final int selectedIndex;
  final void Function() selectOption;
  final String iconUrl;
  final String cardName;
  final String selectedIconUrl;
  final List<Color> iconGradientColors;
  final bool isSelected;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    // bool isSelected = selectedIndex == optionIndex;

    return GestureDetector(
      onTap: selectOption,
      child: Card(
        shadowColor: Colors.transparent,
        shape: isSelected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    appTheme.appDefaults.borderRadiusSmall),
                side: BorderSide(
                    width: 1, color: appTheme.appDefaults.brandPrime))
            : null,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        surfaceTintColor: Colors.transparent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularBankIcon.svg(
                  // isSelected: isSelected,
                  svgIcon: isSelected ? selectedIconUrl : iconUrl,
                  // index: optionIndex,
                  linearGradientColors:
                      isSelected ? checkGradientColors : iconGradientColors),
              const SizedBox(height: 8),
              Text(
                cardName,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ), // Display the option name
            ],
          ),
        ),
      ),
    );
  }
}
