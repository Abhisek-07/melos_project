import 'package:component_example/main.dart';
import 'package:component_example/conditional_file_import_example/file_picker_example.dart';
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
                  path: '/gridview-home',
                  name: 'gridview home',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey, child: const GridViewHome());
                  },
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
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
