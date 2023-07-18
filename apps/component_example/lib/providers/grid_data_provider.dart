import 'dart:convert';

import 'package:component_example/model/grid_option.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}

final gridDataProvider = ChangeNotifierProvider((ref) {
  return GridNotifier();
});
