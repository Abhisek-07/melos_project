import 'package:component_example/providers/options_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils/utils.dart';

class AllOptions extends HookConsumerWidget {
  const AllOptions({
    super.key,
    required this.showIcons,
  });

  final bool showIcons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OptionsNotifier optionsNotifier = ref.watch(optionsProvider);
    final searchController = useTextEditingController();
    // bool clearIcon = false;

    useMemoized(() {
      searchController.addListener(optionsNotifier.showClearIcon);
      optionsNotifier.getSearchOptions();
      return null;
    }, [searchController]);

    void clearSearchText() {
      searchController.clear();
      optionsNotifier.searchOptions = optionsNotifier.options;
      optionsNotifier.removeClearIcon();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 68,
        titleSpacing: 0,
        leading: IconButton(
          // padding: const EdgeInsets.all(4),
          onPressed: () {
            optionsNotifier.resetSelectedIndexInListVewOnBackButtonPress();
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
                onChanged: optionsNotifier.searchCategory,
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  suffixIcon: optionsNotifier.clearIcon
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
              itemCount: optionsNotifier.searchOptions.length,
              itemBuilder: (context, index) {
                final originalIndex = optionsNotifier.options
                    .indexOf(optionsNotifier.searchOptions[index]);
                bool isSelected =
                    optionsNotifier.selectedIndexInListView == originalIndex;
                final option = optionsNotifier.options[originalIndex];

                return CustomListTile(
                  title: option.name,
                  isSelected: isSelected,
                  index: originalIndex,
                  onTap: () {
                    optionsNotifier.setSelectedIndexInListView(originalIndex);
                  },
                  leadingIcon: CircularBankIcon.svg(
                    size: IconSize.low,
                    svgIcon: option.icon,
                    linearGradientColors:
                        index % gradientColorsForBankIcon.length == 0
                            ? gradientColorsForBankIcon[0]
                            : index % gradientColorsForBankIcon.length == 1
                                ? gradientColorsForBankIcon[1]
                                : gradientColorsForBankIcon[2],
                  ),
                  showTrailing: true,
                  showLeading: showIcons,
                  titleTextStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  // contentPadding: EdgeInsets.all(16),
                );
              },
            ),
          ),
          CustomElevatedButton(onPressed: () {
            optionsNotifier
                .selectListOption(optionsNotifier.selectedIndexInListView);
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
