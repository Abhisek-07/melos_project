import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:components/components.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // fontFamily: ,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        background: const Color.fromARGB(255, 253, 247, 253),
        seedColor: const Color.fromARGB(255, 95, 21, 152),
      ),
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndexInListView = -1;
  List<Option> options = [];
  int selectedIndex = -1;
  int totalVisibleOptions = 5;
  String title = 'What is this payment for ?';
  List<Option> visibleOptions = [];

  // this variable is to track the original first option and to set the visibleOptions[0] to it when we select another option from the gridview to restore the original first option.
  int visibleIndexFlag = -1;
  bool showIconsInListView = true;

  Future<void> loadOptions() async {
    final jsonData = await rootBundle.loadString('assets/options.json');
    final jsonOptions = json.decode(jsonData);
    List<dynamic> list = jsonOptions['data'];
    setState(() {
      options = list.map((option) => Option.fromJson(option)).toList();
      visibleOptions = List.from(options);
    });
  }

  @override
  void initState() {
    super.initState();
    loadOptions();
  }

// on selecting list option
  void selectListOption(int? index) {
    if (index != null) {
      setState(() {
        selectedIndexInListView = index;
        selectedIndex = index;
        if (index < totalVisibleOptions) {
          visibleOptions[0] = options[0];
        }
        // visibleOptions = options;
        if (selectedIndex >= totalVisibleOptions) {
          visibleOptions[0] = options[index];
          visibleOptions[index] = options[0];
          visibleIndexFlag = index;
          selectedIndex = 0;
        }
      });
    }
  }

// on select option from gridview
  void selectOption(int index) {
    print(index);

    setState(() {
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
    });
  }

// on selecting more
  void selectMore() {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return AllOptions(
        showIcons: showIconsInListView,
        options: options,
        selectedIndex: selectedIndex,
        onSelectListOption: selectListOption,
        selectedIndexInListView: selectedIndexInListView,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    print(options);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Component'),
      ),
      body: PaymentOptions(
        title: title,
        options: visibleOptions,
        totalVisibleOptions: totalVisibleOptions,
        selectOption: selectOption,
        selectedIndex: selectedIndex,
        selectMore: selectMore,
      ),
    );
  }
}
