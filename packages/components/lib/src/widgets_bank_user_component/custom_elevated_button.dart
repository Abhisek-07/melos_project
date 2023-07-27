import 'package:components/src/app_theme_config/app_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.title = 'Finish',
    required this.onPressed,
    this.buttonBackgroundColor,
    this.useFullScrrenWidth = false,
    required this.appTheme,
    this.titleStyle,
  });

  final String title;
  final void Function() onPressed;
  final Color? buttonBackgroundColor;
  final bool useFullScrrenWidth;
  final TextStyle? titleStyle;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      width: useFullScrrenWidth ? double.infinity : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor:
                  buttonBackgroundColor ?? appTheme.appDefaults.brandPrime,
              // foregroundColor: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: titleStyle ??
                    appTheme.textStyles.button.medium
                        .copyWith(color: appTheme.appDefaults.grayScaleWhite),
              ),
            )),
      ),
    );
  }
}
