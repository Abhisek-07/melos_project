import 'package:component_example/app_theme_config/textStyle_classes/body.dart';
import 'package:component_example/app_theme_config/textStyle_classes/body_bold.dart';
import 'package:component_example/app_theme_config/textStyle_classes/body_link.dart';
import 'package:component_example/app_theme_config/textStyle_classes/body_medium.dart';
import 'package:component_example/app_theme_config/textStyle_classes/button.dart';
import 'package:component_example/app_theme_config/textStyle_classes/headings.dart';

class TextStyles {
  TextStyles({
    required this.headings,
    required this.bodyBold,
    required this.bodyMedium,
    required this.body,
    required this.bodyLink,
    required this.button,
  });

  Headings headings;
  BodyBold bodyBold;
  BodyMedium bodyMedium;
  Body body;
  BodyLink bodyLink;
  Button button;
}
