import 'package:component_example/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class BankUserHome extends ConsumerWidget {
  const BankUserHome({super.key});

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
          // backgroundColor: Colors.green,
          title: AppLocalizations.of(context)?.bankUserHome ?? 'Bank User Home',
          appTheme: theme,
          showBackIcon: false,
        ),
        // AppBar(
        //   title: const Text('Bank User Home'),
        // ),
        body: Center(
          child: CustomElevatedButton(
            appTheme: theme,
            title: AppLocalizations.of(context)?.bankUserComponent ??
                'Bank User Component',
            onPressed: () {
              context.push('/bank-user-home/bank-user');
            },
          ),
          // TextButton(
          //   onPressed: () {
          //     context.push('/bank-user-home/bank-user');
          //   },
          //   child: const Text('Bank User Component'),
          // ),
        ),
      ),
    );
  }
}
