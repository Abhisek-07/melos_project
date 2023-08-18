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
    final theme = ref.watch(themeProvider);

    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)?.gridviewHome ?? 'GridView Home',
          appTheme: theme,
          showBackIcon: false,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(
                appTheme: theme,
                title: AppLocalizations.of(context)?.appStoreComponent ??
                    'App Store Component',
                onPressed: () {
                  context.push('/gridview-home/app-store');
                },
              ),
              CustomElevatedButton(
                appTheme: theme,
                title:
                    AppLocalizations.of(context)?.shakeWidget ?? 'Shake Widget',
                onPressed: () {
                  context.pushNamed('shake');
                },
              ),
              CustomElevatedButton(
                appTheme: theme,
                title:
                    AppLocalizations.of(context)?.filePicker ?? 'File Picker',
                onPressed: () {
                  context.pushNamed('file picker');
                },
              ),
              CustomElevatedButton(
                appTheme: theme,
                title: AppLocalizations.of(context)?.filesAndFolders ??
                    'Files & Folders',
                onPressed: () {
                  context.pushNamed('file folder');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
