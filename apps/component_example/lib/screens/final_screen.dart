import 'package:component_example/providers/selected_user_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FinalScreen extends HookConsumerWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(selectedUserProvider.notifier).clearUser();
        context.go('/bank-user-home');
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Final Screen'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Thank You'),
              const SizedBox(
                height: 24,
              ),
              CustomElevatedButton(
                  title: 'Okay',
                  onPressed: () {
                    context.goNamed('home');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
