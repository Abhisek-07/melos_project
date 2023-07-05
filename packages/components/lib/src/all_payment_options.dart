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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 68,
        titleSpacing: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(4),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              child: TextField(
                onChanged: searchCategory,
                controller: searchController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search'),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Color.fromARGB(34, 21, 20, 20),
                    height: 1,
                  );
                },
                itemCount: searchOptions.length,
                itemBuilder: (context, index) {
                  final originalIndex =
                      widget.options.indexOf(searchOptions[index]);
                  bool isSelected = selectedIndex == originalIndex;

                  return ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                    onTap: () {
                      setState(() {
                        selectedIndex = originalIndex;
                      });
                    },
                    leading: widget.showIcons
                        ? Image.network(
                            widget.options[originalIndex].icon,
                            height: 24,
                            width: 24,
                          )
                        : null,
                    title: Text(widget.options[originalIndex].name),
                    trailing: Container(
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(width: 4, color: Colors.purple)
                              : Border.all(
                                  width: 2,
                                  color: const Color.fromARGB(
                                      112, 158, 158, 158))),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              // padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    widget.onSelectListOption(selectedIndex);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color.fromARGB(255, 122, 44, 195),
                      foregroundColor: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('Finish'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
