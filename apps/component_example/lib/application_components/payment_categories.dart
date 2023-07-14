import 'package:component_example/providers/options_provider.dart';
import 'package:flutter/material.dart';
import 'package:components/components.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PaymentCategories extends HookConsumerWidget {
  const PaymentCategories({super.key});

  final String title = 'What is this payment for ?';

  final bool showIconsInListView = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OptionsNotifier optionNotifier = ref.watch(optionsProvider);

    useMemoized(() {
      optionNotifier.loadOptions();
      return null;
    }, [optionNotifier.isLoadingOptions]);

    if (optionNotifier.isLoadingOptions) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Component'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PaymentOptions(
              title: title,
              options: optionNotifier.visibleOptions
                  .map((visibleOption) => OptionItem(
                      name: visibleOption.name, icon: visibleOption.icon))
                  .toList(),
              totalVisibleOptions: optionNotifier.totalVisibleOptions,
              selectOption: optionNotifier.selectOption,
              selectedIndex: optionNotifier.selectedIndex,
              selectMore: () {
                context.pushNamed('all options', extra: showIconsInListView);
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomElevatedButton(
              title: 'Send Receipt',
              onPressed: optionNotifier.selectedIndex != -1
                  ? () {
                      context.goNamed('final screen');
                    }
                  : () {}),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
