import 'package:component_example/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class GridViewHome extends ConsumerWidget {
  const GridViewHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeNotifier themeNotifier = ref.watch(themeProvider);

    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)?.gridviewHome ?? 'GridView Home',
          appTheme: themeNotifier.theme,
          showBackIcon: false,
        ),
        // AppBar(
        //   title: const Text('GridView Home'),
        // ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(
                appTheme: themeNotifier.theme,
                title: AppLocalizations.of(context)?.appStoreComponent ??
                    'App Store Component',
                onPressed: () {
                  context.push('/gridview-home/app-store');
                },
              ),
              // TextButton(
              //   onPressed: () {
              //     context.push('/gridview-home/app-store');
              //   },
              //   child: const Text('App Store Component'),
              // ),
              CustomElevatedButton(
                appTheme: themeNotifier.theme,
                title:
                    AppLocalizations.of(context)?.shakeWidget ?? 'Shake Widget',
                onPressed: () {
                  context.pushNamed('shake');
                },
              ),
              // TextButton(
              //   onPressed: () {
              //     context.pushNamed('shake');
              //   },
              //   child: const Text('Shake Widget'),
              // ),
              CustomElevatedButton(
                appTheme: themeNotifier.theme,
                title:
                    AppLocalizations.of(context)?.filePicker ?? 'File Picker',
                onPressed: () {
                  context.pushNamed('file picker');
                },
              )
              // TextButton(
              //   onPressed: () {
              //     context.pushNamed('file picker');
              //   },
              //   child: const Text('File Picker'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
