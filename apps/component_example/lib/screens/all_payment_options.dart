import 'package:component_example/providers/options_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';
// import 'package:component_example/model/option.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllOptions extends ConsumerStatefulWidget {
  const AllOptions({
    super.key,
    // required this.options,
    // required this.selectedIndex,
    // required this.onSelectListOption,
    // required this.selectedIndexInListView,
    required this.showIcons,
  });

  // final List<Option> options;
  // final int selectedIndex;
  // final void Function(int?) onSelectListOption;
  // final int selectedIndexInListView;
  final bool showIcons;

  @override
  ConsumerState<AllOptions> createState() => _AllOptionsState();
}

class _AllOptionsState extends ConsumerState<AllOptions> {
  // List<Option> searchOptions = [];
  bool clearIcon = false;
  final searchController = TextEditingController();

  // int? selectedIndex;

  OptionsNotifier? _optionsNotifier;

  // void searchCategory(String query) {
  //   List<Option> results = [];
  //   if (query.isEmpty) {
  //     results = _optionsNotifier!.options;
  //   } else {
  //     results = _optionsNotifier!.options.where((element) {
  //       final name = element.name.toLowerCase();
  //       return name.contains(query.toLowerCase());
  //     }).toList();
  //   }
  //   // refresh the UI
  //   setState(() {
  //     searchOptions = results;
  //   });
  // }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _optionsNotifier = ref.watch(optionsProvider);

      // selectedIndex = _optionsNotifier!.selectedIndexInListView;
      searchController.addListener(showClearIcon);
      _optionsNotifier!.getSearchOptions();
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // void getSelectedIndex(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  void showClearIcon() {
    setState(() {
      clearIcon = true;
    });
  }

  void clearSearchText() {
    setState(() {
      searchController.clear();
      _optionsNotifier!.searchOptions = _optionsNotifier!.options;
      clearIcon = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(optionsProvider);

    if (_optionsNotifier == null) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 68,
        titleSpacing: 0,
        leading: IconButton(
          // padding: const EdgeInsets.all(4),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/back.png',
            width: 32,
            height: 32,
          ),
        ),
        title: const Text('Choose Category'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                onChanged: _optionsNotifier!.searchCategory,
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  suffixIcon: clearIcon
                      ? GestureDetector(
                          onTap: clearSearchText,
                          child: const Icon(Icons.clear_rounded),
                        )
                      : null,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    color: Color.fromARGB(34, 21, 20, 20),
                    height: 1,
                  ),
                );
              },
              itemCount: _optionsNotifier!.searchOptions.length,
              itemBuilder: (context, index) {
                final originalIndex = _optionsNotifier!.options
                    .indexOf(_optionsNotifier!.searchOptions[index]);
                bool isSelected =
                    _optionsNotifier!.selectedIndexInListView == originalIndex;
                final option = _optionsNotifier!.options[originalIndex];

                return CustomListTile(
                  title: option.name,
                  isSelected: isSelected,
                  index: originalIndex,
                  onTap: () {
                    _optionsNotifier!.getSelectedIndexInListView(originalIndex);
                  },
                  leadingIcon: CircularBankIcon.svg(
                    size: IconSize.low,
                    svgIcon: option.icon,
                    // index: originalIndex,
                    linearGradientColors:
                        index % gradientColorsForBankIcon.length == 0
                            ? gradientColorsForBankIcon[0]
                            : index % gradientColorsForBankIcon.length == 1
                                ? gradientColorsForBankIcon[1]
                                : gradientColorsForBankIcon[2],
                  ),
                  showTrailing: true,
                  showLeading: widget.showIcons,
                  titleTextStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  // contentPadding: EdgeInsets.all(16),
                );

                // return ListTile(
                //   contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                //   onTap: () {
                //     setState(() {
                //       selectedIndex = originalIndex;
                //     });
                //   },
                //   leading: widget.showIcons
                //       ? Image.network(
                //           widget.options[originalIndex].icon,
                //           height: 24,
                //           width: 24,
                //         )
                //       : null,
                //   title: Text(widget.options[originalIndex].name),
                //   trailing: CircularSelectButton(
                //     isSelected: isSelected,
                //   ),
                // );
              },
            ),
          ),
          CustomElevatedButton(onPressed: () {
            _optionsNotifier!
                .selectListOption(_optionsNotifier!.selectedIndexInListView);
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
