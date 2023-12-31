import 'package:bus_routes_app/ui/bus_routes/providers/routes_provider.dart';
import 'package:bus_routes_app/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final timeFormat = DateFormat('HH:mm');

class BusRouteDetailsScreen extends ConsumerWidget {
  const BusRouteDetailsScreen({super.key, required this.route});

  final BusRoute route;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RoutesNotifier routesNotifier = ref.watch(routesProvider);
    final theme = ref.watch(themeProvider);

    // int? remainingTime;
    // String? tripEndTime;

    // if (route.shortestTripStartTime != null) {
    //   remainingTime = routesNotifier
    //       .getRemainingTimeInMinutes(route.shortestTripStartTime!);
    //   tripEndTime = routesNotifier.getTripEndTime(
    //       route.shortestTripStartTime!, route.tripDuration);

    //   // removed check if remainingTime <= 0, as it is handled in sortRoutesByTime by setting route.shortestTripStartTime to null for every route at first(maybe changed later in same method) on every call to sortRoutesByTime
    // }
    return Scaffold(
      appBar: CustomAppBar(title: 'Route: ${route.name}', appTheme: theme),
      body:
          // route.trips.isEmpty
          //     ? Center(
          //         child: Text(
          //           'No upcoming trips',
          //           style:
          //               theme.textStyles.bodyBold.large.copyWith(color: Colors.red),
          //         ),
          //       )
          //     :
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            'Route Details',
            style: theme.textStyles.bodyBold.large
                .copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Source: ${route.source}',
            style: theme.textStyles.bodyMedium.large,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Destination: ${route.destination}',
            style: theme.textStyles.bodyMedium.large,
          ),
          const SizedBox(
            height: 8,
          ),
          if (route.trips.isEmpty)
            Expanded(
              child: Center(
                child: Text(
                  'No upcoming trips',
                  style: theme.textStyles.bodyBold.large
                      .copyWith(color: Colors.red),
                ),
              ),
            )
          else
            for (var trip in route.trips)
              timeFormat.parse(trip.tripStartTime).isAfter(
                      timeFormat.parse(timeFormat.format(DateTime.now())))
                  ? Opacity(
                      opacity: 1,
                      child: CustomListTile(
                        title: 'Arriving',
                        titleTextStyle: theme.textStyles.body.medium
                            .copyWith(color: Colors.green),
                        leadingIcon: Image.asset(
                          "assets/images/bus.png",
                        ),
                        subtitle:
                            'in : ${routesNotifier.getRemainingTimeInMinutes(trip.tripStartTime)} minutes',
                        showTrailing: true,
                        trailingWidget: Text(
                          '${trip.tripStartTime} : ${routesNotifier.getTripEndTime(trip.tripStartTime, route.tripDuration)}',
                          style: theme.textStyles.body.small
                              .copyWith(color: theme.appDefaults.grayScale80),
                        ),
                        subtitleTextStyle: theme.textStyles.body.small
                            .copyWith(color: theme.appDefaults.grayScale80),
                        showBorder: true,
                        borderRadius: 16,
                        paddingAroundListTile: const EdgeInsets.all(8),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                    )
                  : Opacity(
                      opacity: 0.6,
                      child: CustomListTile(
                        title: 'Departed',
                        titleTextStyle: theme.textStyles.body.medium
                            .copyWith(color: Colors.red),
                        leadingIcon: Image.asset(
                          "assets/images/bus.png",
                        ),
                        subtitle: "----",
                        showTrailing: true,
                        trailingWidget: Text(
                          '${trip.tripStartTime} : ${routesNotifier.getTripEndTime(trip.tripStartTime, route.tripDuration)}',
                          style: theme.textStyles.body.small
                              .copyWith(color: theme.appDefaults.grayScale80),
                        ),
                        showBorder: true,
                        borderRadius: 16,
                        paddingAroundListTile: const EdgeInsets.all(8),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                    ),
        ],
      ),
    );
    //   Center(
    //       child: Text(remainingTime != null
    //           ? remainingTime.toString()
    //           : "No upcoming trips")),
    // );
  }
}
