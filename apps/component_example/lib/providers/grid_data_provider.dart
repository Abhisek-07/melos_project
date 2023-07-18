import 'dart:convert';

import 'package:component_example/model/grid_option.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridNotifier extends ChangeNotifier {
  GridNotifier() : super();
  List<GridOption> gridOptionsList = [];
  bool isLoadingGridOptions = true;

  List<GridOption> get gridOptions => gridOptionsList;

  Future<void> getGridOptions() async {
    final String response = await rootBundle.loadString('assets/options.json');
    final data = await json.decode(response);
    List<dynamic> list = data["gridData"];
    gridOptionsList = list.map((item) => GridOption.fromJson(item)).toList();
    isLoadingGridOptions = false;
    notifyListeners();
  }

  void pinOrUnpinCard(GridOption option) {
    option.isPinned = !option.isPinned;
    notifyListeners();
  }

  void showBottomSheet(BuildContext context, GridOption option) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'App Options',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  pinOrUnpinCard(option);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    leading: SvgPicture.asset(option.isPinned
                        ? 'assets/icons/unpin.svg'
                        : 'assets/icons/pin1.svg'),
                    title: Text(
                      option.isPinned ? 'Unpin App' : 'Pin App',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final gridDataProvider = ChangeNotifierProvider((ref) {
  return GridNotifier();
});
