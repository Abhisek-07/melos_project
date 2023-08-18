import 'package:component_example/providers/selected_locale_provider.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:utils/utils.dart';

DateTime? currentBackPressTime;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

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
          title: AppLocalizations.of(context)?.appTitle ?? 'My Components',
          appTheme: theme,
          showBackIcon: false,
        ),
        //     AppBar(
        //   title: const Text('My components examples'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppLocalizations.of(context)?.welcomeHome ?? 'Welcome Home'),
              const SizedBox(
                height: spacing16,
              ),
              CustomElevatedButton(
                  title: AppLocalizations.of(context)?.changeToEnglish ??
                      'Change app language to english',
                  onPressed: () {
                    ref
                        .read(selectedLocaleProvider.notifier)
                        .changeAppLanguage('en');
                  },
                  appTheme: theme),
              const SizedBox(
                height: spacing16,
              ),
              CustomElevatedButton(
                  title: AppLocalizations.of(context)?.changeToHindi ??
                      'Change app language to hindi',
                  onPressed: () {
                    ref
                        .read(selectedLocaleProvider.notifier)
                        .changeAppLanguage('hi');
                  },
                  appTheme: theme),
            ],
          ),
        ),
      ),
    );
  }
}
