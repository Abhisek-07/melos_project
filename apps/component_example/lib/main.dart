import 'dart:developer';

import 'package:component_example/app_theme_data_initializer/theme_service.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:component_example/app_router_config/router_config.dart';
import 'package:utils/utils.dart';

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
            NavigationBar(
              backgroundColor: themeNotifier.theme.appDefaults.grayScaleWhite,
              indicatorColor: themeNotifier.theme.appDefaults.grayScaleWhite,
              selectedIndex: navigationShell.currentIndex,
              destinations: [
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.balance,
                    color: themeNotifier.theme.appDefaults.grayScaleBlack,
                  ),
                  icon: Icon(
                    Icons.balance,
                    color: themeNotifier.theme.appDefaults.grayScale70,
                  ),
                  label: 'Home',
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
                  label: 'Bank User',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.grid_3x3,
                    color: themeNotifier.theme.appDefaults.grayScaleBlack,
                  ),
                  icon: Icon(
                    Icons.grid_3x3,
                    color: themeNotifier.theme.appDefaults.grayScale70,
                  ),
                  label: 'App Store',
                ),
              ],
              onDestinationSelected: (index) {
                _goBranch(index);
              },
            ),
          ],
        ));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeService.initAppStyles();
  final container = ProviderContainer();
  await container.read(themeProvider).initAppTheme(
      textStyles: ThemeService.textStyles,
      appDefaults: ThemeService.appDefaults,
      themeData: ThemeService.themeData);
  log(container.read(themeProvider).appTheme.appDefaults.toJson().toString());
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

    return MaterialApp.router(
      routerConfig: goRouter, theme: themeNotifier.theme.themedata,
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
