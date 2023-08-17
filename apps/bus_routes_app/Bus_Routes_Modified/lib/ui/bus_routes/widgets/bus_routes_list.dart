import 'package:bus_routes_app/ui/bus_routes/bus_route_details_screen.dart';
import 'package:bus_routes_app/ui/bus_routes/providers/routes_provider.dart';
import 'package:bus_routes_app/ui/bus_routes/widgets/bus_routes_card.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:bus_routes_app/widgets/route_alert_dialog.dart';

final timeFormat = DateFormat('HH:mm');

class BusRoutesList extends HookConsumerWidget {
  const BusRoutesList({
    super.key,
    required this.scrollerController,
  });

  final ScrollController scrollerController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onRefresh: routesNotifier.refreshList,
      child: ListView.builder(
          controller: scrollerController,
          itemCount: routesNotifier.sortedBusRoutes.length,
          itemBuilder: (context, index) {
            final BusRoute route = routesNotifier.sortedBusRoutes[index];

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
            return BusRouteCard(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BusRouteDetailsScreen(route: route);
                  },
                ));
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return RouteAlertDialog(route: route);
                //     });
              },
              route: route,
              remainingTime: remainingTime,
              tripEndTime: tripEndTime,
            );
          }),
    );
  }
}
