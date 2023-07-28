import 'package:component_example/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

DateTime? currentBackPressTime;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeNotifier themeNotifier = ref.watch(themeProvider);

    Future<bool> onWillPop() {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: 'Press back again to exit app');
        return Future.value(false);
      }
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.appTitle,
          appTheme: themeNotifier.theme,
          showBackIcon: false,
        ),
        //     AppBar(
        //   title: const Text('My components examples'),
        // ),
        body: Center(
          child: Text(AppLocalizations.of(context)!.welcomeHome),
        ),
      ),
    );
  }
}
