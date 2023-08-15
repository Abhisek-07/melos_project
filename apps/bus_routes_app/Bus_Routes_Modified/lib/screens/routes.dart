// import 'package:bus_routes_app/models/bus_routes.dart';
// import 'package:bus_routes_app/service/api_service.dart';
import 'package:bus_routes_app/providers/routes_provider.dart';
import 'package:bus_routes_app/screens/shimmer_loading_screen.dart';
// import 'package:core/core.dart';
import 'package:bus_routes_app/widgets/routes_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RoutesScreen extends StatefulHookConsumerWidget {
  const RoutesScreen({super.key});

  @override
  ConsumerState<RoutesScreen> createState() {
    return _RoutesScreenState();
  }
}

class _RoutesScreenState extends ConsumerState<RoutesScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = true;
  final double _appBarHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      if (_scrollController.offset <= 0.0) {
        _isAppBarVisible = true;
      } else {
        _isAppBarVisible = false;
      }
    });
  }

  // Here we get the http request data using a future builder and handle its states & pass the data to routes list
  @override
  Widget build(BuildContext context) {
    RoutesNotifier routesNotifier = ref.watch(routesProvider);

    // return FutureBuilder(
    //   future: ref.watch(routesProvider.future),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       // return const Center(
    //       //   child: CircularProgressIndicator(),
    //       // );
    //       return const ShimmerLoadingScreen();
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Text('Error: ${snapshot.error}'),
    //       );
    //     } else if (snapshot.hasData) {
    //       List<BusRoute> busRoutes = snapshot.data!;

    useMemoized(() {
      routesNotifier.init();
      return null;
    }, [routesNotifier.isFetchingBusData]);

    if (routesNotifier.isFetchingBusData) {
      return const ShimmerLoadingScreen();
    } else {
      return Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: _isAppBarVisible ? _appBarHeight : 80,
              child: AppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.inversePrimary,
                      Theme.of(context).colorScheme.primaryContainer,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                ),
                centerTitle: true,
                title: const Text('Routes'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 80, 30, 30),
              child: RoutesList(
                  busRoutes: routesNotifier.routes,
                  scrollerController: _scrollController),
              // FutureBuilder(
              //   future: ref.watch(routesProvider.future),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       // return const Center(
              //       //   child: CircularProgressIndicator(),
              //       // );
              //       return const ShimmerLoadingScreen();
              //     } else if (snapshot.hasError) {
              //       return Center(
              //         child: Text('Error: ${snapshot.error}'),
              //       );
              //     } else if (snapshot.hasData) {
              //       List<BusRoute> busRoutes = snapshot.data!;

              //       return RoutesList(
              //           busRoutes: busRoutes,
              //           scrollerController: _scrollController);
              //     } else {
              //       return const Center(child: Text('No data available'));
              //     }
              //   },
              // ),
            ),
          ],
        ),
      );
    }
    // } else {
    //   return const Center(child: Text('No data available'));
    // }
  }
  // );
}
// }
