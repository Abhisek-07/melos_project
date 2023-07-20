import 'package:component_example/main.dart';
import 'package:component_example/screens/home_screen.dart';
import 'package:component_example/screens/preview_screen.dart';
import 'package:component_example/application_components/bank_user_component.dart';
import 'package:component_example/application_components/payment_categories.dart';
import 'package:component_example/screens/all_payment_options.dart';
import 'package:component_example/screens/app_store.dart';
import 'package:component_example/screens/bank_transfer_screen.dart';
import 'package:component_example/screens/bank_user_home.dart';
import 'package:component_example/screens/final_screen.dart';
import 'package:component_example/screens/grid_view_home.dart';
import 'package:component_example/screens/shake_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _navigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final goRouter = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
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
                builder: (context, state) {
                  return const HomeScreen();
                },
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey, child: const HomeScreen());
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
                  builder: (context, state) {
                    return const BankUserHome();
                  },
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey, child: const BankUserHome());
                  },
                  routes: [
                    GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        name: 'bank transfer component',
                        path: 'bank-user',
                        builder: (context, state) {
                          return const BankUserComponent();
                        },
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
                              builder: (context, state) {
                                return const BankTransferScreen();
                              },
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
                                    builder: (context, state) {
                                      return const PreviewScreen();
                                    },
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
                                          builder: (context, state) {
                                            return const PaymentCategories();
                                          },
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
                                              builder: (context, state) {
                                                bool showIcons =
                                                    state.extra as bool;
                                                return AllOptions(
                                                  showIcons: showIcons,
                                                );
                                              },
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
                  path: '/gridview-home',
                  name: 'gridview home',
                  builder: (context, state) {
                    return const GridViewHome();
                  },
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey, child: const GridViewHome());
                  },
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      name: 'app store',
                      path: 'app-store',
                      builder: (context, state) {
                        return const AppStore();
                      },
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                            key: state.pageKey, child: const AppStore());
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
                      builder: (context, state) {
                        return const RotatingShakeWidget();
                      },
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                            key: state.pageKey,
                            child: const RotatingShakeWidget());
                      },
                    )
                  ])
            ],
          ),
        ],
      ),
      GoRoute(
        // parentNavigatorKey: _rootNavigatorKey,
        path: '/final-screen',
        name: 'final screen',
        builder: (context, state) {
          return const FinalScreen();
        },
        pageBuilder: (context, state) {
          return NoTransitionPage(
              key: state.pageKey, child: const FinalScreen());
        },
      ),
    ]);
