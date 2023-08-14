import 'package:components/src/app_theme_config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.title,
    required this.onPressed,
    this.buttonBackgroundColor,
    this.useFullScrrenWidth = false,
    required this.appTheme,
    this.titleStyle,
    this.buttonBorderRadius,
    this.paddingAroundText,
  });

  final String? title;
  final void Function() onPressed;
  final Color? buttonBackgroundColor;
  final bool useFullScrrenWidth;
  final TextStyle? titleStyle;
  final double? buttonBorderRadius;
  final AppTheme appTheme;
  final EdgeInsetsGeometry? paddingAroundText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      width: useFullScrrenWidth ? double.infinity : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: padding16,
        ),
        // const EdgeInsets.all(padding16),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  buttonBorderRadius ?? appTheme.appDefaults.borderRadiusSmall,
                ),
              ),
              backgroundColor:
                  buttonBackgroundColor ?? appTheme.appDefaults.brandPrime,
              // foregroundColor: Colors.white,
            ),
            child: Padding(
              padding: paddingAroundText ??
                  const EdgeInsets.symmetric(
                    vertical: padding16,
                  ),
              child: Text(
                title ?? 'Finish',
                style: titleStyle ??
                    appTheme.textStyles.button.medium
                        .copyWith(color: appTheme.appDefaults.grayScaleWhite),
              ),
            )),
      ),
    );
  }
}
