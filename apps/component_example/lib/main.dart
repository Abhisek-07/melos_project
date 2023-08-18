// import 'dart:developer';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

// import 'package:component_example/app_theme_data_initializer/theme_service.dart';
import 'package:component_example/l10n/l10n.dart';
import 'package:component_example/providers/selected_locale_provider.dart';
import 'package:component_example/providers/theme_defaults_provider.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:component_example/navigation/router_config.dart';
import 'package:utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'l10n/l10n.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class ScaffoldWithNestedNavigation extends ConsumerWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                bottom: padding4,
              ),
              child: Divider(
                height: 1,
                color: theme.appDefaults.grayScale60,
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                elevation: 0,
                unselectedFontSize: 12,
                selectedFontSize: 12,
                selectedItemColor: theme.appDefaults.grayScaleBlack,
                unselectedItemColor: theme.appDefaults.grayScale70,
                backgroundColor: theme.appDefaults.grayScaleWhite,
                // indicatorColor: themeNotifier.theme.appDefaults.grayScaleWhite,
                currentIndex: navigationShell.currentIndex,
                items: [
                  BottomNavBarItem(
                    appTheme: theme,
                    activeColor: theme.appDefaults.grayScaleBlack,
                    activeIconPath: 'assets/icons/home.svg',
                    iconPath: 'assets/icons/home.svg',
                    inactiveColor: theme.appDefaults.grayScale70,
                    label: AppLocalizations.of(context)?.home ?? 'Home',
                  ),
                  BottomNavBarItem(
                    appTheme: theme,
                    activeColor: theme.appDefaults.grayScaleBlack,
                    activeIconPath: 'assets/icons/capital.svg',
                    iconPath: 'assets/icons/capital.svg',
                    inactiveColor: theme.appDefaults.grayScale70,
                    label:
                        AppLocalizations.of(context)?.bankUser ?? 'Bank User',
                  ),
                  BottomNavBarItem(
                    appTheme: theme,
                    activeColor: theme.appDefaults.grayScaleBlack,
                    activeIconPath: 'assets/icons/app_store.svg',
                    iconPath: 'assets/icons/app_store.svg',
                    inactiveColor: theme.appDefaults.grayScale70,
                    label:
                        AppLocalizations.of(context)?.appStore ?? 'App Store',
                  ),
                ],
                onTap: (index) {
                  _goBranch(index);
                },
              ),
            ),
          ],
        ));
  }
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ThemeDefaultsProvider themeDefaultsProviderImpl =
      await ThemeDefaultsProvider.init();
  // FlutterNativeSplash.remove();
  runApp(ProviderScope(
    overrides: [
      themeDefaultsProvider.overrideWithValue(themeDefaultsProviderImpl)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final selectedLanguage = ref.watch(selectedLocaleProvider);

    return MaterialApp.router(
      routerConfig: goRouter, theme: theme.themedata,
      supportedLocales: L10n.all,
      locale: Locale(selectedLanguage),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(
      //     background: const Color.fromARGB(255, 253, 247, 253),
      //     seedColor: const Color.fromARGB(255, 95, 21, 152),
      //   ),
      // ),
      // home: const HomeScreen(),
    );
  }
}
