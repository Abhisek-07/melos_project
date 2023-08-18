import 'package:component_example/main.dart';
import 'package:component_example/ui/misc/conditional_file_import_example/file_picker_example.dart';
import 'package:component_example/ui/misc/file_folder_example_screen.dart';
import 'package:component_example/ui/home/home_screen.dart';
import 'package:component_example/ui/bank_user/preview_screen.dart';
import 'package:component_example/ui/bank_user/bank_user_component.dart';
import 'package:component_example/ui/payment_category/payment_categories.dart';
import 'package:component_example/ui/payment_category/all_payment_options.dart';
import 'package:component_example/ui/app_store/app_store.dart';
import 'package:component_example/ui/bank_user/bank_transfer_screen.dart';
import 'package:component_example/ui/bank_user/bank_user_home.dart';
import 'package:component_example/ui/payment_category/final_screen.dart';
import 'package:component_example/ui/app_store/app_store_home_screen.dart';
import 'package:component_example/ui/misc/shake_widget.dart';
import 'package:component_example/ui/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _navigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final goRouter = GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (context, state) {
          return NoTransitionPage(
              key: state.pageKey, child: const SplashScreen());
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                name: 'home',
                path: '/home',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const HomeScreen(),
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0))
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                  path: '/bank-user-home',
                  name: 'bank user home',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey, child: const BankUserHome());
                  },
                  routes: [
                    GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        name: 'bank transfer component',
                        path: 'bank-user',
                        pageBuilder: (context, state) {
                          return NoTransitionPage(
                              key: state.pageKey,
                              child: const BankUserComponent());
                        },
                        routes: [
                          GoRoute(
                              parentNavigatorKey: _rootNavigatorKey,
                              path: 'bank-transfer',
                              name: 'bank transfer',
                              pageBuilder: (context, state) {
                                return NoTransitionPage(
                                    key: state.pageKey,
                                    child: const BankTransferScreen());
                              },
                              routes: [
                                GoRoute(
                                    parentNavigatorKey: _rootNavigatorKey,
                                    path: 'preview-screen',
                                    name: 'preview screen',
                                    pageBuilder: (context, state) {
                                      return NoTransitionPage(
                                          key: state.pageKey,
                                          child: const PreviewScreen());
                                    },
                                    routes: [
                                      GoRoute(
                                          parentNavigatorKey: _rootNavigatorKey,
                                          name: 'payment categories',
                                          path: 'payment-categories',
                                          pageBuilder: (context, state) {
                                            return NoTransitionPage(
                                                key: state.pageKey,
                                                child:
                                                    const PaymentCategories());
                                          },
                                          routes: [
                                            // GoRoute(
                                            //   path: 'final-screen',
                                            //   name: 'final screen',
                                            //   builder: (context, state) {
                                            //     return const FinalScreen();
                                            //   },
                                            // ),
                                            GoRoute(
                                              parentNavigatorKey:
                                                  _rootNavigatorKey,
                                              path: 'all-options',
                                              name: 'all options',
                                              pageBuilder: (context, state) {
                                                bool showIcons =
                                                    state.extra as bool;
                                                return NoTransitionPage(
                                                    key: state.pageKey,
                                                    child: AllOptions(
                                                      showIcons: showIcons,
                                                    ));
                                              },
                                            )
                                          ])
                                    ])
                              ])
                        ])
                  ]),
              // GoRoute(
              //   // parentNavigatorKey: _rootNavigatorKey,
              //   path: '/final-screen',
              //   name: 'final screen',
              //   builder: (context, state) {
              //     return const FinalScreen();
              //   },
              // ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              GoRoute(
                  path: '/app-store-home',
                  name: 'app store home',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey, child: const AppStoreHomeScreen());
                  },
                  routes: [
                    GoRoute(
                      // parentNavigatorKey: _rootNavigatorKey,
                      name: 'app store',
                      path: 'app-store',

                      pageBuilder: (context, state) {
                        return CustomTransitionPage(
                          key: state.pageKey,
                          child: const AppStore(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        );
                      },
                      // routes: [
                      //   GoRoute(
                      //     path: 'all-options',
                      //     name: 'all options',
                      //     builder: (context, state) {
                      //       bool showIcons = state.extra as bool;
                      //       return AllOptions(
                      //         showIcons: showIcons,
                      //       );
                      //     },
                      //   )
                      // ]
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      name: 'shake',
                      path: 'shake-widget',
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                            key: state.pageKey,
                            child: const RotatingShakeWidget());
                      },
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      name: 'file picker',
                      path: 'file-picker',
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                            key: state.pageKey,
                            child: const FilePickerExample());
                      },
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      name: 'file folder',
                      path: 'file-folder',
                      pageBuilder: (context, state) {
                        return CustomTransitionPage(
                          key: state.pageKey,
                          child: const FileFolderScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                      begin: const Offset(1, 0),
                                      end: const Offset(0, 0))
                                  .animate(animation),
                              child: child,
                            );
                          },
                        );
                      },
                    ),
                  ])
            ],
          ),
        ],
      ),
      GoRoute(
        // parentNavigatorKey: _rootNavigatorKey,
        path: '/final-screen',
        name: 'final screen',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const FinalScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
          );
        },
      ),
    ]);
