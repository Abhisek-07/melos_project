import 'package:component_example/providers/grid_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:components/components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:another_flushbar/flushbar.dart';

class AppStore extends HookConsumerWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GridNotifier gridNotifier = ref.watch(gridDataProvider);

    useMemoized(() {
      gridNotifier.getGridOptions();
      return null;
    }, [gridNotifier.isLoadingGridOptions]);

    // if (gridNotifier.isLoadingGridOptions) {
    //   return const CircularProgressIndicator();
    // }

    // showTopAlertDialog(BuildContext context) {
    //   final overlay = Overlay.of(context);
    //   final overlayEntry = OverlayEntry(
    //     builder: (context) => Positioned(
    //       // width: double.infinity,
    //       top: 0,
    //       left: 0,
    //       right: 0,
    //       child: Material(
    //         child: Container(
    //           padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
    //           height: 80,
    //           width: double.infinity,
    //           color: Colors.red,
    //           alignment: Alignment.topCenter,
    //           child: const Center(
    //             child: Text(
    //               'This app is coming soon!',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );

    //   overlay.insert(overlayEntry);

    //   // Wait for a few seconds and then remove the overlay entry
    //   Future.delayed(const Duration(seconds: 2), () {
    //     overlayEntry.remove();
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Store'),
      ),
      body: gridNotifier.isLoadingGridOptions
          ? const CircularProgressIndicator()
          : Column(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 12,
                      crossAxisSpacing: 4,
                      // , childAspectRatio:
                    ),
                    itemCount: gridNotifier.gridOptions.length,
                    itemBuilder: (context, index) {
                      final option = gridNotifier.gridOptions[index];

                      return AnimatedCard(
                        name: option.name,
                        icon: option.icon,
                        isComingSoon: option.isComingSoon,
                        isPinned: option.isPinned,
                        onLongPress: () {
                          gridNotifier.showBottomSheet(context, option);
                        },

                        /// shakeAnimationTime in milliseconds
                        // shakeAnimationTime: 3000,
                        // isAnimationEnabled: false,
                        showAlert: () {
                          Flushbar(
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Colors.red,
                            message: 'This app is coming soon',
                            icon: const Icon(
                              Icons.info_outline,
                              size: 28.0,
                              color: Colors.white,
                            ),
                            duration: const Duration(seconds: 2),
                          ).show(context);

                          // ScaffoldMessenger.of(context).clearSnackBars();
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Text('hi bro'),
                          //   duration: Duration(seconds: 2),
                          // ));

                          // showTopAlertDialog(context);
                        },
                      );

                      // return AppCard(index: index);
                    },
                  ),
                ))
              ],
            ),
    );
  }
}
