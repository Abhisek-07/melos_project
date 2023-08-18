import 'package:component_example/providers/theme_defaults_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:components/components.dart';

final themeProvider = Provider((ref) {
  final themeDefaults = ref.read(themeDefaultsProvider);

  return AppTheme(
    appDefaults: themeDefaults.getAppDefautls,
    textStyles: themeDefaults.getTextStyles,
    themedata: themeDefaults.getThemeData,
  );
});
