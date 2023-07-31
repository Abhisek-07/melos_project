import 'dart:developer';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:component_example/app_theme_data_initializer/theme_service.dart';
import 'package:component_example/l10n/l10n.dart';
import 'package:component_example/providers/selected_locale_provider.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:component_example/app_router_config/router_config.dart';
import 'package:utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'l10n/l10n.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:flutter_svg/flutter_svg.dart';

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
    ThemeNotifier themeNotifier = ref.watch(themeProvider);

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Components'),
        // ),
        body: navigationShell,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Divider(
                height: 1,
                color: themeNotifier.theme.appDefaults.grayScale60,
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: NavigationBar(
                backgroundColor: themeNotifier.theme.appDefaults.grayScaleWhite,
                indicatorColor: themeNotifier.theme.appDefaults.grayScaleWhite,
                selectedIndex: navigationShell.currentIndex,
                destinations: [
                  NavigationDestination(
                    selectedIcon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      colorFilter: ColorFilter.mode(
                          themeNotifier.theme.appDefaults.grayScaleBlack,
                          BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      colorFilter: ColorFilter.mode(
                          themeNotifier.theme.appDefaults.grayScale70,
                          BlendMode.srcIn),
                    ),
                    label: AppLocalizations.of(context)?.home ?? 'Home',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.balance,
                      color: themeNotifier.theme.appDefaults.grayScaleBlack,
                    ),
                    icon: Icon(
                      Icons.balance,
                      color: themeNotifier.theme.appDefaults.grayScale70,
                    ),
                    label:
                        AppLocalizations.of(context)?.bankUser ?? 'Bank User',
                  ),
                  NavigationDestination(
                    selectedIcon: SvgPicture.asset(
                      'assets/icons/app_store.svg',
                      colorFilter: ColorFilter.mode(
                          themeNotifier.theme.appDefaults.grayScaleBlack,
                          BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/app_store.svg',
                      colorFilter: ColorFilter.mode(
                          themeNotifier.theme.appDefaults.grayScale70,
                          BlendMode.srcIn),
                    ),
                    label:
                        AppLocalizations.of(context)?.appStore ?? 'App Store',
                  ),
                ],
                onDestinationSelected: (index) {
                  _goBranch(index);
                },
              ),
            ),
          ],
        ));
  }
}

void main() async {
  // WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ThemeService.initAppStyles();
  final container = ProviderContainer();
  await container.read(themeProvider).initAppTheme(
      textStyles: ThemeService.textStyles,
      appDefaults: ThemeService.appDefaults,
      themeData: ThemeService.themeData);
  log(container.read(themeProvider).appTheme.appDefaults.toJson().toString());
  log(container
      .read(themeProvider)
      .theme
      .appDefaults
      .borderRadiusSmall
      .toString());
  // FlutterNativeSplash.remove();
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeNotifier themeNotifier = ref.watch(themeProvider);
    final selectedLanguage = ref.watch(selectedLocaleProvider);

    return MaterialApp.router(
      routerConfig: goRouter, theme: themeNotifier.theme.themedata,
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
