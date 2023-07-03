import 'package:components/src/model/option.dart';
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
  List searchOptions = [];

  int? selectedIndex;
  final searchController = TextEditingController();

// search feature
  // void searchCategorys(String query) {
  //   final suggestions = searchOptions.where((option) {
  //     final title = option.name.toLowerCase();
  //     final input = query.toLowerCase();

  //     return title.contains(input);
  //   }).toList();

  //   setState(() {
  //     searchOptions = suggestions;
  //   });
  // }

  void searchCategory(String query) {
    List results = [];
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an option'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: SizedBox(
              height: 40,
              child: TextField(
                onChanged: searchCategory,
                controller: searchController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    color: Color.fromARGB(34, 21, 20, 20),
                  ),
                );
              },
              itemCount: searchOptions.length,
              itemBuilder: (context, index) {
                final originalIndex =
                    widget.options.indexOf(searchOptions[index]);
                bool isSelected = selectedIndex == originalIndex;

                /// THIS WILL BE IMPLEMENTED LATER TO TRACK THE SELECTED OPTION IN THE LISTVIEW

                return SizedBox(
                  width: double.infinity,
                  child: RadioListTile(
                    // fillColor: MaterialStateProperty.all(Colors.purple),
                    activeColor: Theme.of(context).colorScheme.primary,
                    selected: isSelected,
                    value: originalIndex,
                    groupValue: selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = originalIndex;
                      });
                      // widget.onSelectListOption(selectedIndex);
                      // Navigator.pop(context);
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Row(
                      children: [
                        widget.showIcons
                            ? Image.network(
                                widget.options[originalIndex].icon,
                                height: 24,
                                width: 24,
                              )
                            : Container(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(widget.options[originalIndex].name),
                      ],
                    ),
                  ),
                  // child: ListTile(
                  //   leading: widget.showIcons
                  //       ? Image.network(
                  //           widget.options[index].icon,
                  //           height: 24,
                  //           width: 24,
                  //         )
                  //       : Container(),
                  //   title: Text(widget.options[index].name),
                  //   trailing: Radio(
                  //       focusColor:
                  //           isSelected ? Theme.of(context).primaryColor : null,
                  //       value: index,
                  //       groupValue: selectedIndex,
                  //       onChanged: (index) {
                  //         setState(() {
                  //           selectedIndex = index;
                  //         });
                  //         widget.onSelectListOption(index);
                  //         Navigator.pop(context);
                  //       }),
                  // ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  widget.onSelectListOption(selectedIndex);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: const Color.fromARGB(255, 122, 44, 195),
                    foregroundColor: Colors.white),
                child: const Text('Finish')),
          )
        ],
      ),
    );
  }
}
