import 'package:component_example/ui/app_store/providers/app_store_provider.dart';
import 'package:component_example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:components/components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:utils/utils.dart';

class AppStore extends HookConsumerWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    AppStoreNotifier appStoreNotifier = ref.watch(appStoreProvider);

    useMemoized(() {
      appStoreNotifier.getGridOptions();
      return null;
    }, [
      // gridNotifier.isLoadingGridOptions
    ]);

    Flushbar? currentFlushBar;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 250, 255),

      // appBar:
      //     // CustomAppBar(
      //     //   // svgBackIconAsset: 'assets/icons/more.svg',
      //     //   title: 'App Store',
      //     //   appTheme: themeNotifier.theme,
      //     // ),
      //     AppBar(
      //         systemOverlayStyle: const SystemUiOverlayStyle(
      //           statusBarColor: Colors.transparent,
      //           statusBarIconBrightness: Brightness.dark,
      //           statusBarBrightness: Brightness.light,
      //         ),
      //         automaticallyImplyLeading: false,
      //         toolbarHeight: 100,
      //         flexibleSpace: Container(
      //           decoration: BoxDecoration(
      //               gradient: LinearGradient(
      //                   colors:
      //                       themeNotifier.theme.appDefaults.gradientPrime1)),
      //         ),
      //         title: const Padding(
      //           padding: EdgeInsets.fromLTRB(
      //               padding20, padding16, padding20, defaultPadding),
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'App Store',
      //                   ),
      //                   Spacer(),
      //                   Icon(Icons.search)
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: spacing16,
      //               ),
      //               Text(
      //                   'You can add extra points in your submenu for fast switching between pages'),
      //             ],
      //           ),
      //         )),
      body: appStoreNotifier.isLoadingGridOptions
          ? const Center(child: CircularProgressIndicator())
          : NestedScrollView(
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      backgroundColor: Colors.transparent,
                      collapsedHeight: 80,
                      expandedHeight: 150,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.dark,
                        statusBarBrightness: Brightness.light,
                      ),
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          padding: EdgeInsets.fromLTRB(
                              defaultPadding,
                              MediaQuery.of(context).padding.top + padding16,
                              defaultPadding,
                              defaultPadding),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: theme.appDefaults.gradientPrime1)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'App Store',
                                    style: theme.textStyles.bodyBold.large
                                        .copyWith(
                                            color: theme
                                                .appDefaults.grayScaleWhite,
                                            fontSize: spacing24),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.search,
                                    color: theme.appDefaults.grayScaleWhite,
                                    size: spacing40,
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: spacing16,
                              ),
                              Text(
                                'You can add extra points in your submenu for fast switching between pages',
                                style: theme.textStyles.body.small.copyWith(
                                    color: theme.appDefaults.grayScaleWhite),
                              ),
                            ],
                          ),
                        ),
                      )),
                ];
              },
              body: Container(
                padding: const EdgeInsets.only(top: defaultPadding),
                child: Builder(builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'App Store Grid View',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          itemCount: appStoreNotifier.gridOptions.length,
                          itemBuilder: (context, index) {
                            final option = appStoreNotifier.gridOptions[index];

                            return AnimatedCard(
                              name: option.name,
                              icon: option.icon,
                              isComingSoon: option.isComingSoon,
                              isPinned: option.isPinned,
                              onLongPress: () {
                                appStoreNotifier.showBottomSheet(
                                    context, option);
                              },

                              /// shakeAnimationTime in milliseconds
                              // shakeAnimationTime: 3000,
                              // isAnimationEnabled: false,
                              showAlert: () async {
                                if (currentFlushBar != null &&
                                    currentFlushBar!.isShowing()) {
                                  currentFlushBar!.dismiss();
                                }

                                currentFlushBar = await Flushbar(
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
                  );
                }),
              ),
            ),
    );
  }
}
