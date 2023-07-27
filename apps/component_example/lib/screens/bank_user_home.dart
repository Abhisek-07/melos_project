import 'package:component_example/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BankUserHome extends ConsumerWidget {
  const BankUserHome({super.key});

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
          // backgroundColor: Colors.green,
          title: 'Bank User Home',
          appTheme: themeNotifier.theme,
          showBackIcon: false,
        ),
        // AppBar(
        //   title: const Text('Bank User Home'),
        // ),
        body: Center(
          child: CustomElevatedButton(
            appTheme: themeNotifier.theme,
            title: 'Bank User Component',
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
