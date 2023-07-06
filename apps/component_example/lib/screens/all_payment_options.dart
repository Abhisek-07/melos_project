import 'package:components/components.dart';
import 'package:flutter/material.dart';

class AllOptions extends StatefulWidget {
  const AllOptions({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelectListOption,
    required this.showIcons,
    required this.selectedIndexInListView,
  });

  final List<Option> options;
  final int selectedIndex;
  final void Function(int?) onSelectListOption;
  final bool showIcons;
  final int selectedIndexInListView;

  @override
  State<AllOptions> createState() => _AllOptionsState();
}

class _AllOptionsState extends State<AllOptions> {
  List<Option> searchOptions = [];
  bool clearIcon = false;
  int? selectedIndex;
  final searchController = TextEditingController();

  void searchCategory(String query) {
    List<Option> results = [];
    if (query.isEmpty) {
      results = widget.options;
    } else {
      results = widget.options.where((element) {
        final name = element.name.toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    }
    // refresh the UI
    setState(() {
      searchOptions = results;
    });
  }

  @override
  void initState() {
    searchOptions = widget.options;
    selectedIndex = widget.selectedIndexInListView;
    searchController.addListener(showClearIcon);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void showClearIcon() {
    setState(() {
      clearIcon = true;
    });
  }

  void clearSearchText() {
    setState(() {
      searchController.clear();
      searchOptions = widget.options;
      clearIcon = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                onChanged: searchCategory,
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
              itemCount: searchOptions.length,
              itemBuilder: (context, index) {
                final originalIndex =
                    widget.options.indexOf(searchOptions[index]);
                bool isSelected = selectedIndex == originalIndex;
                final option = widget.options[originalIndex];

                return CustomListTile(
                  title: option.name,
                  isSelected: isSelected,
                  index: originalIndex,
                  onTap: () {
                    getSelectedIndex(originalIndex);
                  },
                  leadingIcon: CircularBankIcon.network(
                    size: CircularBankIconSize.low,
                    networkUrl: option.icon,
                  ),
                  showTrailing: true,
                  titleTextStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
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
            widget.onSelectListOption(selectedIndex);
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
