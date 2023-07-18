// import 'package:component_example/application_components/bank_user_component.dart';
// import 'package:component_example/application_components/payment_categories.dart';
// import 'package:component_example/screens/all_payment_options.dart';
// import 'package:component_example/screens/app_store.dart';
// import 'package:component_example/screens/bank_transfer_screen.dart';
// import 'package:component_example/screens/bank_user_home.dart';
// import 'package:component_example/screens/final_screen.dart';
// import 'package:component_example/screens/grid_view_home.dart';
// // import 'package:component_example/screens/grid_view_home.dart';
// import 'package:component_example/screens/home_screen.dart';
// import 'package:component_example/screens/preview_screen.dart';
// // import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:component_example/app_router_config/router_config.dart';

// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// // final _navigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
// final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
// final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

// final goRouter = GoRouter(
//     initialLocation: '/home',
//     navigatorKey: _rootNavigatorKey,
//     routes: [
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, navigationShell) {
//           return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
//         },
//         branches: [
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorHomeKey,
//             routes: [
//               GoRoute(
//                 name: 'home',
//                 path: '/home',
//                 builder: (context, state) {
//                   return const HomeScreen();
//                 },
//               )
//             ],
//           ),
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorAKey,
//             routes: [
//               GoRoute(
//                   path: '/bank-user-home',
//                   name: 'bank user home',
//                   builder: (context, state) {
//                     return const BankUserHome();
//                   },
//                   routes: [
//                     GoRoute(
//                         parentNavigatorKey: _rootNavigatorKey,
//                         name: 'bank transfer component',
//                         path: 'bank-user',
//                         builder: (context, state) {
//                           return const BankUserComponent();
//                         },
//                         routes: [
//                           GoRoute(
//                               parentNavigatorKey: _rootNavigatorKey,
//                               path: 'bank-transfer',
//                               name: 'bank transfer',
//                               builder: (context, state) {
//                                 return const BankTransferScreen();
//                               },
//                               routes: [
//                                 GoRoute(
//                                     parentNavigatorKey: _rootNavigatorKey,
//                                     path: 'preview-screen',
//                                     name: 'preview screen',
//                                     builder: (context, state) {
//                                       return const PreviewScreen();
//                                     },
//                                     routes: [
//                                       GoRoute(
//                                           parentNavigatorKey: _rootNavigatorKey,
//                                           name: 'payment categories',
//                                           path: 'payment-categories',
//                                           builder: (context, state) {
//                                             return const PaymentCategories();
//                                           },
//                                           routes: [
//                                             // GoRoute(
//                                             //   path: 'final-screen',
//                                             //   name: 'final screen',
//                                             //   builder: (context, state) {
//                                             //     return const FinalScreen();
//                                             //   },
//                                             // ),
//                                             GoRoute(
//                                               parentNavigatorKey:
//                                                   _rootNavigatorKey,
//                                               path: 'all-options',
//                                               name: 'all options',
//                                               builder: (context, state) {
//                                                 bool showIcons =
//                                                     state.extra as bool;
//                                                 return AllOptions(
//                                                   showIcons: showIcons,
//                                                 );
//                                               },
//                                             )
//                                           ])
//                                     ])
//                               ])
//                         ])
//                   ]),
//               // GoRoute(
//               //   // parentNavigatorKey: _rootNavigatorKey,
//               //   path: '/final-screen',
//               //   name: 'final screen',
//               //   builder: (context, state) {
//               //     return const FinalScreen();
//               //   },
//               // ),
//             ],
//           ),
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorBKey,
//             routes: [
//               GoRoute(
//                   path: '/gridview-home',
//                   name: 'gridview home',
//                   builder: (context, state) {
//                     return const GridViewHome();
//                   },
//                   routes: [
//                     GoRoute(
//                       parentNavigatorKey: _rootNavigatorKey,
//                       name: 'app store',
//                       path: 'app-store',
//                       builder: (context, state) {
//                         return const AppStore();
//                       },
//                       // routes: [
//                       //   GoRoute(
//                       //     path: 'all-options',
//                       //     name: 'all options',
//                       //     builder: (context, state) {
//                       //       bool showIcons = state.extra as bool;
//                       //       return AllOptions(
//                       //         showIcons: showIcons,
//                       //       );
//                       //     },
//                       //   )
//                       // ]
//                     )
//                   ])
//             ],
//           ),
//         ],
//       ),
//       GoRoute(
//         // parentNavigatorKey: _rootNavigatorKey,
//         path: '/final-screen',
//         name: 'final screen',
//         builder: (context, state) {
//           return const FinalScreen();
//         },
//       ),
//     ]);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Components'),
        // ),
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.balance), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.balance), label: 'Bank User'),
            NavigationDestination(
                icon: Icon(Icons.grid_3x3), label: 'App Store'),
          ],
          onDestinationSelected: (index) {
            _goBranch(index);
          },
        ));
  }
}

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        // fontFamily: ,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          background: const Color.fromARGB(255, 253, 247, 253),
          seedColor: const Color.fromARGB(255, 95, 21, 152),
        ),
      ),
      // home: const HomeScreen(),
    );
  }
}
