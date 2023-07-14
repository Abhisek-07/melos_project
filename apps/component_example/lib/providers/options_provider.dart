import 'dart:convert';

import 'package:component_example/model/option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionsNotifier extends ChangeNotifier {
  OptionsNotifier(this.ref) : super();

  final Ref ref;
  int totalVisibleOptions = 5;

  List<Option> options = [];
  List<Option> visibleOptions = [];
  int selectedIndex = -1;
  int selectedIndexInListView = -1;
  // this variable is to track the original first option and to set the visibleOptions[0] to it when we select another option from the gridview to restore the original first option.
  int visibleIndexFlag = -1;
  // bool showIconsInListView = false; //// HANDLED BY PASSING THROUGH EXTRA PARAM OF GO ROUTER

  bool isLoadingOptions = true;

  Future<void> loadOptions() async {
    // isLoadingOptions = true;
    // notifyListeners();
    final jsonData = await rootBundle.loadString('assets/options.json');
    final jsonOptions = json.decode(jsonData);
    List<dynamic> list = jsonOptions['data'];
    options = list.map((option) => Option.fromJson(option)).toList();
    visibleOptions = List.from(options);

    // await Future.delayed(const Duration(seconds: 2));
    isLoadingOptions = false;
    notifyListeners();
  }

  // on selecting list option
  void selectListOption(int? index) {
    if (index != null) {
      selectedIndexInListView = index;
      selectedIndex = index;
      if (index < totalVisibleOptions) {
        visibleOptions[0] = options[0];
      }
      if (selectedIndex >= totalVisibleOptions) {
        visibleOptions[0] = options[index];
        visibleOptions[index] = options[0];
        visibleIndexFlag = index;
        selectedIndex = 0;
      }
    }
    notifyListeners();
  }

  // on select option from gridview
  void selectOption(int index) {
    print(index);

    if (visibleIndexFlag != -1) {
      visibleOptions[0] = visibleOptions[visibleIndexFlag];
      visibleIndexFlag = -1;
    }
    if (selectedIndex == index) {
      selectedIndex = -1;
      selectedIndexInListView = -1;
    } else {
      selectedIndex = index;
      selectedIndexInListView = index;
    }
    notifyListeners();
  }

  // void updateSelectedIndexInListViewOnWillPop() {
  //   selectedIndexInListView = selectedIndex;
  //   notifyListeners();
  // }

  /// for search feautre in all options page
  List<Option> searchOptions = [];

  void getSearchOptions() {
    searchOptions = options;
  }

  void searchCategory(String query) {
    List<Option> results = [];
    if (query.isEmpty) {
      results = options;
    } else {
      results = options.where((element) {
        final name = element.name.toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    }
    // refresh the UI
    searchOptions = results;
    notifyListeners();
  }

  bool clearIcon = false;

  void showClearIcon() {
    clearIcon = true;
    notifyListeners();
  }

  void removeClearIcon() {
    clearIcon = false;
    notifyListeners();
  }

  void getSelectedIndexInListView(int index) {
    selectedIndexInListView = index;
    notifyListeners();
  }
}

final optionsProvider = ChangeNotifierProvider.autoDispose((ref) {
  return OptionsNotifier(ref);
});
