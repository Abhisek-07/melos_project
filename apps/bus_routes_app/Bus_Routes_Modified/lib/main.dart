import 'package:bus_routes_app/providers/theme_defaults_provider.dart';
import 'package:bus_routes_app/ui/splash/splash_screen.dart';
import 'package:bus_routes_app/service/notification_service.dart';
import 'package:bus_routes_app/service/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeDefaultsProvider themeDefaultsProviderImpl =
      await ThemeDefaultsProvider.init();
  await NotificationService.init();

  runApp(ProviderScope(overrides: [
    themeDefaultsProvider.overrideWithValue(themeDefaultsProviderImpl)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'Bus Routes',
      home: const SplashScreen(),
    );
  }
}
