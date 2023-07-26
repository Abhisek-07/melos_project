import 'package:component_example/app_theme_data_initializer/theme_service.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:component_example/app_router_config/router_config.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Components'),
        // ),
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.balance), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.balance), label: 'Bank User'),
            NavigationDestination(
                icon: Icon(Icons.grid_3x3), label: 'App Store'),
          ],
          onDestinationSelected: (index) {
            _goBranch(index);
          },
        ));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeService.initAppStyles();
  final container = ProviderContainer();
  await container.read(themeProvider).initAppTheme(
      textStyles: ThemeService.textStyles,
      appColors: ThemeService.appColors,
      themeData: ThemeService.themeData);
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
