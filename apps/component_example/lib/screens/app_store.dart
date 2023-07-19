import 'package:component_example/providers/grid_data_provider.dart';
import 'package:component_example/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    // final animationController = useAnimationController(
    //   duration: const Duration(milliseconds: 300),
    // );

    // final animation = useAnimation(
    //   TweenSequence([
    //     TweenSequenceItem(
    //       tween: Tween<double>(begin: 0.0, end: 15.0),
    //       weight: 1,
    //     ),
    //     TweenSequenceItem(
    //       tween: Tween<double>(begin: 15.0, end: -15.0),
    //       weight: 1,
    //     ),
    //     TweenSequenceItem(
    //       tween: Tween<double>(begin: -15.0, end: 0.0),
    //       weight: 1,
    //     ),
    //   ]).animate(animationController),
    // );

    // int repeatCount = 0;

    // void _startAnimation() {
    //   repeatCount = 0;
    //   animationController.forward(from: 0.0);
    // }

    // void runAnimation() {
    //   if (animationController.status == AnimationStatus.completed ||
    //       animationController.status == AnimationStatus.dismissed) {
    //     _startAnimation();
    //   }
    // }

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
                // final option = gridNotifier.gridOptions[index];
                // bool isComingSoon = option.isComingSoon;
                // bool isPinned = option.isPinned;

                return AppCard(index: index);

                // return AnimatedBuilder(
                //   key: UniqueKey(),
                //   animation: animationController,
                //   builder: (context, child) {
                //     return Transform.rotate(
                //       angle: animation * 3.1415926535 / 180.0,
                //       child: child,
                //     );
                //   },
                //   child: Stack(
                //     clipBehavior: Clip.none,
                //     alignment: Alignment.center,
                //     fit: StackFit.expand,
                //     children: [
                //       Positioned(
                //           top: 4,
                //           bottom: 8,
                //           left: 4,
                //           right: 4,
                //           child: Opacity(
                //             opacity: isComingSoon ? 0.5 : 1,
                //             child: Material(
                //               borderRadius: BorderRadius.circular(8),
                //               color: Colors.white,
                //               child: InkWell(
                //                 borderRadius: BorderRadius.circular(8),
                //                 onLongPress: () {
                //                   !isComingSoon
                //                       ? gridNotifier.showBottomSheet(
                //                           context, option)
                //                       : isComingSoon
                //                           ? runAnimation()
                //                           : null;
                //                 },
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                     // color: Colors.white,
                //                     borderRadius: BorderRadius.circular(8),
                //                     border: isComingSoon
                //                         ? Border.all(
                //                             color: const Color.fromARGB(
                //                                 81, 31, 31, 31))
                //                         : isPinned
                //                             ? Border.all(
                //                                 color: const Color.fromARGB(
                //                                     255, 148, 94, 218))
                //                             : null,
                //                   ),
                //                   padding: const EdgeInsets.symmetric(
                //                     horizontal: 12,
                //                     vertical: 16,
                //                   ),
                //                   child: Column(
                //                     mainAxisSize: MainAxisSize.min,
                //                     children: [
                //                       SvgPicture.asset(
                //                         option.icon,
                //                       ),
                //                       const SizedBox(
                //                         height: 12,
                //                       ),
                //                       Expanded(
                //                         child: Text(
                //                           option.name,
                //                           style: const TextStyle(fontSize: 12),
                //                           overflow: TextOverflow.ellipsis,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           )),
                //       if (isComingSoon)
                //         Positioned(
                //           bottom: 0,
                //           child: Container(
                //             padding: const EdgeInsets.symmetric(horizontal: 4),
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               border: Border.all(
                //                 color: Colors.grey.shade300,
                //               ),
                //               borderRadius: const BorderRadius.all(
                //                 Radius.circular(4),
                //               ),
                //             ),
                //             child: const Center(
                //               child: Text(
                //                 'Coming Soon',
                //                 style: TextStyle(
                //                   fontSize: 10,
                //                   fontWeight: FontWeight.w300,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       if (isPinned)
                //         Positioned(
                //           top: 0,
                //           right: 0,
                //           child: Container(
                //             height: 20,
                //             width: 20,
                //             decoration: const BoxDecoration(
                //                 color: Color.fromARGB(255, 148, 94, 218),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(4))),
                //             child: SvgPicture.asset('assets/icons/pin.svg'),
                //           ),
                //         ),
                //     ],
                //   ),
                // );
              },
            ),
          ))
        ],
      ),
    );
  }
}
