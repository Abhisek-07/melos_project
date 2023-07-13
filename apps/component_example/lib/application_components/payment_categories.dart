import 'package:component_example/providers/options_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
import 'package:components/components.dart';
// import 'package:component_example/screens/all_payment_options.dart';
// import 'package:component_example/model/option.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PaymentCategories extends HookConsumerWidget {
  const PaymentCategories({super.key});

  // ConsumerState<PaymentCategories> createState() => _PaymentCategoriesState();

// class _PaymentCategoriesState extends ConsumerState<PaymentCategories> {
  final String title = 'What is this payment for ?';

  // int selectedIndexInListView = -1;
  // List<Option> options = [];
  // int selectedIndex = -1;
  // int totalVisibleOptions = 5;
//   List<Option> visibleOptions = [];

//   // this variable is to track the original first option and to set the visibleOptions[0] to it when we select another option from the gridview to restore the original first option.
//   int visibleIndexFlag = -1;
  final bool showIconsInListView = true;

//   Future<void> loadOptions() async {
//     final jsonData = await rootBundle.loadString('assets/options.json');
//     final jsonOptions = json.decode(jsonData);
//     List<dynamic> list = jsonOptions['data'];
//     setState(() {
//       options = list.map((option) => Option.fromJson(option)).toList();
//       visibleOptions = List.from(options);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadOptions();
//   }

// // on selecting list option
//   void selectListOption(int? index) {
//     if (index != null) {
//       setState(() {
//         selectedIndexInListView = index;
//         selectedIndex = index;
//         if (index < totalVisibleOptions) {
//           visibleOptions[0] = options[0];
//         }
//         // visibleOptions = options;
//         if (selectedIndex >= totalVisibleOptions) {
//           visibleOptions[0] = options[index];
//           visibleOptions[index] = options[0];
//           visibleIndexFlag = index;
//           selectedIndex = 0;
//         }
//       });
//     }
//   }

// // on select option from gridview
//   void selectOption(int index) {
//     print(index);

//     setState(() {
//       if (visibleIndexFlag != -1) {
//         visibleOptions[0] = visibleOptions[visibleIndexFlag];
//         visibleIndexFlag = -1;
//       }
//       if (selectedIndex == index) {
//         selectedIndex = -1;
//         selectedIndexInListView = -1;
//       } else {
//         selectedIndex = index;
//         selectedIndexInListView = index;
//       }
//     });
//   }

  // OptionsNotifier? _optionNotifier;

  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _optionNotifier = ref.watch(optionsProvider);
  //     _optionNotifier!.loadOptions();
  //   });
  // }

// on selecting more
  // void selectMore() {
  //   context.pushNamed('all options', extra: showIconsInListView);

  //   // Navigator.push(context, MaterialPageRoute(builder: (ctx) {
  //   //   return AllOptions(
  //   //     showIcons: showIconsInListView,
  //   //     // options: options,
  //   //     // selectedIndex: selectedIndex,
  //   //     // onSelectListOption: selectListOption,
  //   //     // selectedIndexInListView: selectedIndexInListView,
  //   //   );
  //   // }));
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(options);

    /// check if this ref.watch() is needed...

    OptionsNotifier optionNotifier = ref.watch(optionsProvider);

    useMemoized(() {
      optionNotifier.loadOptions();
      return null;
    }, [optionNotifier.isLoadingOptions]);

    if (optionNotifier.isLoadingOptions) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Component'),
      ),
      body: PaymentOptions(
        title: title,
        options: optionNotifier.visibleOptions
            .map((visibleOption) =>
                OptionItem(name: visibleOption.name, icon: visibleOption.icon))
            .toList(),
        totalVisibleOptions: optionNotifier.totalVisibleOptions,
        selectOption: optionNotifier.selectOption,
        selectedIndex: optionNotifier.selectedIndex,
        selectMore: () {
          context.pushNamed('all options', extra: showIconsInListView);
        },
      ),
    );
  }
}
