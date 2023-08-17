import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:bus_routes_app/service/notification_service.dart';

// import 'package:bus_routes_app/utils/utils.dart';
import 'package:bus_routes_app/service/shared_preferences_helper.dart';
import 'package:workmanager/workmanager.dart';

Workmanager workmanager = Workmanager();

// method executed by workmanager
void callbackDispatcher() {
  workmanager.executeTask((task, inputData) async {
    if (task == "sortRoutesTask") {
      final container = ProviderContainer().read(routesProvider);
      List<BusRoute> sortedRoutes =
          await SharedPreferencesHelper.getSortedRoutesFromSharedPreferences();
      sortedRoutes = container.sortRoutesByTime(sortedRoutes);

      if (sortedRoutes.isNotEmpty &&
          sortedRoutes[0].shortestTripStartTime != null) {
        final remainingTime = container
            .getRemainingTimeInMinutes(sortedRoutes[0].shortestTripStartTime!);
        // NotificationService notificationService = NotificationService();
        // await notificationService.init();
        await NotificationService.init();
        NotificationService.showNotification(
            sortedRoutes[0].name, remainingTime);
      }

      await SharedPreferencesHelper.saveSortedRoutesToSharedPreferences(
          sortedRoutes);
    }

    return Future.value(true);
  });
}

final timeFormat = DateFormat('HH:mm');

class RoutesNotifier extends ChangeNotifier {
  RoutesNotifier(this.ref) : super();

  final Ref ref;
  // NotificationService notificationService = NotificationService();
  List<BusRoute> busRoutes = [];

  List<BusRoute> get routes => busRoutes;

  bool isFetchingBusData = true;
  List<BusRoute> sortedRoutes = [];

  List<BusRoute> get sortedBusRoutes => sortedRoutes;
  Timer? timer;
  bool isRefreshing = false;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void init() async {
    await getBusRoutesData();
    // await initializeNotifications();
    await updateDataFirstTime();
    await startTimer();
    isFetchingBusData = false;
    notifyListeners();
    configureWorkManager();
  }

  Future<void> getBusRoutesData() async {
    ApiService apiService = ApiService();
    final busRoutesData = await apiService.getData();
    busRoutes = busRoutesData;
  }

  // starts timer for periodic update of bus routes every minute
  Future<void> startTimer() async {
    timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      updateData();
    });
  }

  // Future<void> initializeNotifications() async {
  //   await notificationService.init();
  // }

  // updates sorted list of bus routes
  void updateData() async {
    sortedRoutes = sortRoutesByTime(busRoutes);
    notifyListeners();
    // saving sorted routes to shared preferences
    await SharedPreferencesHelper.saveSortedRoutesToSharedPreferences(
        sortedRoutes);

    // logic for showing notifications when 5 minutes till next bus
    if (sortedRoutes.isNotEmpty &&
        sortedRoutes[0].shortestTripStartTime != null) {
      final remainingTime =
          getRemainingTimeInMinutes(sortedRoutes[0].shortestTripStartTime!);

      if (remainingTime == 5) {
        NotificationService.showNotification(
            sortedRoutes[0].name, remainingTime);
      }
    }
  }

  Future<void> updateDataFirstTime() async {
    sortedRoutes = sortRoutesByTime(busRoutes);
    // saving sorted routes to shared preferences
    await SharedPreferencesHelper.saveSortedRoutesToSharedPreferences(
        sortedRoutes);

    // logic for showing notifications when 5 minutes till next bus
    if (sortedRoutes.isNotEmpty &&
        sortedRoutes[0].shortestTripStartTime != null) {
      final remainingTime =
          getRemainingTimeInMinutes(sortedRoutes[0].shortestTripStartTime!);

      // if (remainingTime == 5) {
      NotificationService.showNotification(sortedRoutes[0].name, remainingTime);
      // }
    }
  }

  // function to be executed on pull to refresh
  Future<void> refreshList() async {
    isRefreshing = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1500));
    isRefreshing = false;
    updateData();
  }

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
      initialDelay: const Duration(seconds: 10),
    );
  }

// sorts the trips of each route (only upcoming trips, i.e, trips after current time) and then sorts
// the routes based on the shortest remaining time(first entry of upcoming trips) of each route
  List<BusRoute> sortRoutesByTime(List<BusRoute> routes) {
    final deviceTime = timeFormat.format(DateTime.now());

    // sorts the trips for each trip (if there are upcoming trips)
    routes.forEach((route) {
      // resetting each route's shortestTripStartTime so that remainingMinutes does not become negative after last trip of each route because of previously stored value...
      route.shortestTripStartTime = null;

      // changed trips sorting logic so that trips are aleady sorted and no need of sorting again before displaying in alert dialog... also used routes variable to sort in place
      if (route.trips.isNotEmpty) {
        route.trips.sort(((a, b) => timeFormat
            .parse(a.tripStartTime)
            .compareTo(timeFormat.parse(b.tripStartTime))));

        Trip firstUpcomingTrip = route.trips.firstWhere(
          (trip) => timeFormat
              .parse(trip.tripStartTime)
              .isAfter(timeFormat.parse(deviceTime)),
          orElse: () => Trip(tripStartTime: '', totalSeats: -1, available: -1),
        );

        print(firstUpcomingTrip.tripStartTime);

        if (firstUpcomingTrip.tripStartTime.isNotEmpty) {
          route.shortestTripStartTime = firstUpcomingTrip.tripStartTime;
        }
      }
    });

    // sorts the routes based on the shortestTripStartTime property
    routes.sort((a, b) {
      final shortestStartTimeA = a.shortestTripStartTime != null
          ? timeFormat.parse(a.shortestTripStartTime!)
          : null;
      final shortestStartTimeB = b.shortestTripStartTime != null
          ? timeFormat.parse(b.shortestTripStartTime!)
          : null;

      if (shortestStartTimeA != null && shortestStartTimeB != null) {
        return shortestStartTimeA.compareTo(shortestStartTimeB);
      } else if (shortestStartTimeA != null) {
        return -1;
      } else if (shortestStartTimeB != null) {
        return 1;
      } else {
        return 0;
      }
    });

    routes.forEach((element) {
      print(element.shortestTripStartTime);
    });

    return routes;
  }

  // returns trips end time using trip start time and duration
  String getTripEndTime(String tripStartTime, String tripDuration) {
    // Parse the trip start time
    final startTime = timeFormat.parse(tripStartTime);

    // Split the trip duration into parts

    final durationParts = tripDuration.split(' ');

    int hours = 0;
    int minutes = 0;

    for (final part in durationParts) {
      // if string contains 'hrs', it is no of hours, else it contains no of minutes
      if (part.contains('hrs')) {
        final value = int.tryParse(part.split('hrs')[0]);
        if (value != null) {
          hours = value;
        }
      } else {
        final value = int.tryParse(part);
        if (value != null) {
          minutes = value;
        }
      }
    }

    DateTime endTime = startTime.add(Duration(hours: hours, minutes: minutes));
    final formattedEndTime = timeFormat.format(endTime);

    return formattedEndTime;
  }

// returns remaining time from tripTime compared to currentTime
  int getRemainingTimeInMinutes(String tripTime) {
    final currentTime = timeFormat.format(DateTime.now());
    final remainingTime =
        timeFormat.parse(tripTime).difference(timeFormat.parse(currentTime));

    return remainingTime.inMinutes;
  }
}

final routesProvider =
    ChangeNotifierProvider.autoDispose((ref) => RoutesNotifier(ref));
