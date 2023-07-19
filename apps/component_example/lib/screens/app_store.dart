import 'package:component_example/providers/grid_data_provider.dart';
// import 'package:component_example/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:components/components.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStore extends HookConsumerWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GridNotifier gridNotifier = ref.watch(gridDataProvider);

    useMemoized(() {
      gridNotifier.getGridOptions();
      return null;
    }, [gridNotifier.isLoadingGridOptions]);

    if (gridNotifier.isLoadingGridOptions) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Store'),
      ),
      body: Column(
        children: [
          const Text(
            'App Store Grid View',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 4,
                // , childAspectRatio:
              ),
              itemCount: gridNotifier.gridOptions.length,
              itemBuilder: (context, index) {
                final option = gridNotifier.gridOptions[index];
                // bool isComingSoon = option.isComingSoon;
                // bool isPinned = option.isPinned;

                return AnimatedCard(
                    name: option.name,
                    icon: option.icon,
                    isComingSoon: option.isComingSoon,
                    isPinned: option.isPinned,
                    onLongPress: () {
                      gridNotifier.showBottomSheet(context, option);
                    });

                // return AppCard(index: index);
              },
            ),
          ))
        ],
      ),
    );
  }
}
