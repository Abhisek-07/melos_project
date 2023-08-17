import 'package:bus_routes_app/providers/theme_defaults_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:components/components.dart';

final themeProvider = Provider((ref) {
  final themeDefaults = ref.read(themeDefaultsProvider);

  return AppTheme(
    appDefaults: themeDefaults.getAppDefautls,
    textStyles: themeDefaults.getTextStyles,
    themedata: themeDefaults.getThemeData,
  );
});
