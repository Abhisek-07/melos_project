import 'dart:async';

// import 'package:bus_routes_app/models/bus_routes.dart';
import 'package:bus_routes_app/providers/routes_provider.dart';
import 'package:core/core.dart';
import 'package:bus_routes_app/utils/notification_service.dart';
import 'package:bus_routes_app/widgets/routes_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';

import 'package:bus_routes_app/utils/utils.dart';
import 'package:bus_routes_app/utils/shared_preferences_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// made global variable to use in workmanager and by this screen, the busRoutes list is available
List<BusRoute> sortedRoutes = [];
Workmanager workmanager = Workmanager();
final timeFormat = DateFormat('HH:mm');

// method executed by workmanager
void callbackDispatcher() {
  workmanager.executeTask((task, inputData) async {
    if (task == "sortRoutesTask") {
      sortedRoutes =
          await SharedPreferencesHelper.getSortedRoutesFromSharedPreferences();
      sortedRoutes = sortRoutesByTime(sortedRoutes);

      if (sortedRoutes.isNotEmpty &&
          sortedRoutes[0].shortestTripStartTime != null) {
        final remainingTime =
            getRemainingTimeInMinutes(sortedRoutes[0].shortestTripStartTime!);
        NotificationService notificationService = NotificationService();
        await notificationService.init();
        notificationService.showNotification(
            sortedRoutes[0].name, remainingTime);
      }

      await SharedPreferencesHelper.saveSortedRoutesToSharedPreferences(
          sortedRoutes);
    }

    return Future.value(true);
  });
}

class RoutesList extends StatefulHookConsumerWidget {
  const RoutesList({
    super.key,
    // required this.busRoutes,
    required this.scrollerController,
  });

  final ScrollController scrollerController;
  // final List<BusRoute> busRoutes;

  @override
  ConsumerState<RoutesList> createState() => _RoutesListState();
}

class _RoutesListState extends ConsumerState<RoutesList> {
  // Timer? timer;

  // NotificationService notificationService = NotificationService();

  // bool isLoading = false;

  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     GlobalKey<RefreshIndicatorState>();

  // timer is initialised inside initstate and first call to updateData to sort the routes, notifications and work manager are also initialized
  @override
  void initState() {
    super.initState();
    // updateData();
    // startTimer();
    // initializeNotifications();
    configureWorkManager();
  }

  // void initializeNotifications() async {
  //   await notificationService.init();
  // }

  // for configuring the work manager
  void configureWorkManager() async {
    await workmanager.initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
    workmanager.registerPeriodicTask(
      "sortRoutesTask",
      "sortRoutesTask",
      frequency: const Duration(minutes: 1),
      initialDelay: const Duration(seconds: 2),
    );
  }

  // dispose method
  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }

  // // updates sorted list of bus routes
  // void updateData() async {
  //   setState(() {
  //     sortedRoutes = sortRoutesByTime(widget.busRoutes);
  //   });

  //   // saving sorted routes to shared preferences
  //   await SharedPreferencesHelper.saveSortedRoutesToSharedPreferences(
  //       sortedRoutes);

  //   // logic for showing notifications when 5 minutes till next bus
  //   if (sortedRoutes.isNotEmpty &&
  //       sortedRoutes[0].shortestTripStartTime != null) {
  //     final remainingTime =
  //         getRemainingTimeInMinutes(sortedRoutes[0].shortestTripStartTime!);

  //     if (remainingTime == 5) {
  //       notificationService.showNotification(
  //           sortedRoutes[0].name, remainingTime);
  //     }
  //   }
  // }

  // // starts timer for periodic update of bus routes every minute
  // void startTimer() {
  //   timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
  //     updateData();
  //   });
  // }

  // // function to be executed on pull to refresh
  // Future<void> _refreshList() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   await Future.delayed(const Duration(milliseconds: 1500));

  //   isLoading = false;
  //   updateData();
  // }

  @override
  Widget build(BuildContext context) {
    RoutesNotifier routesNotifier = ref.watch(routesProvider);

    if (routesNotifier.isRefreshing) {
      return Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1),
          duration: const Duration(milliseconds: 1500),
          builder: (context, value, _) => CircularProgressIndicator(
            value: value,
          ),
        ),
      );
    }

    return RefreshIndicator(
      key: routesNotifier.refreshIndicatorKey,
      // _refreshIndicatorKey,
      onRefresh: routesNotifier.refreshList,
      // _refreshList,
      child: ListView.builder(
          controller: widget.scrollerController,
          itemCount: routesNotifier.sortedBusRoutes.length,
          itemBuilder: (context, index) {
            final route = routesNotifier.sortedBusRoutes[index];

            int? remainingTime;
            String? tripEndTime;

            if (route.shortestTripStartTime != null) {
              remainingTime = routesNotifier
                  .getRemainingTimeInMinutes(route.shortestTripStartTime!);
              tripEndTime = routesNotifier.getTripEndTime(
                  route.shortestTripStartTime!, route.tripDuration);

              // removed check if remainingTime <= 0, as it is handled in sortRoutesByTime by setting route.shortestTripStartTime to null for every route at first(maybe changed later in same method) on every call to sortRoutesByTime
            }

            // removed sorting logic fro trips from here, as they are sorted in sortRoutesByTime method itself (routes as well as their trips)

            // widget for route card
            return RouteCard(
              route: route,
              remainingTime: remainingTime,
              tripEndTime: tripEndTime,
            );
          }),
    );
  }
}
