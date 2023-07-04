// import 'dart:math';

import 'package:components/src/widgets/more.dart';
import 'package:flutter/material.dart';
// import '../../models/option.dart';
import 'package:components/src/model/option.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({
    super.key,
    required this.options,
    this.totalVisibleOptions = 5,
    required this.selectOption,
    required this.selectedIndex,
    required this.selectMore,
    required this.title,
  });

  final List<Option> options;
  final int totalVisibleOptions;
  final void Function(int) selectOption;
  final int selectedIndex;
  final void Function() selectMore;
  final String title;

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildOptionItem(int optionIndex) {
    bool isSelected = widget.selectedIndex == optionIndex;

    return GestureDetector(
      onTap: () {
        widget.selectOption(optionIndex);
      },
      child: Card(
        shadowColor: Colors.transparent,
        shape: isSelected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.inversePrimary))
            : null,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        surfaceTintColor: Colors.transparent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(isSelected
                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-uiLoP-wwWSf1QbBjZ08aDtbMATzc2BwFsg&usqp=CAU'
                        : widget.options[optionIndex]
                            .icon), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.options[optionIndex].name,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ), // Display the option name
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.options);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.9),
                itemCount: widget.options.length <= widget.totalVisibleOptions
                    ? widget.options.length
                    : widget.totalVisibleOptions + 1,
                itemBuilder: (context, index) {
                  if (index == widget.totalVisibleOptions &&
                      widget.options.length > widget.totalVisibleOptions) {
                    return MoreCard(
                      iconUrl:
                          'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/more-512.png',
                      selectMore: widget.selectMore,
                    );
                    // return GestureDetector(
                    //   onTap: widget.selectMore,
                    //   child: Card(
                    //     shadowColor: Colors.transparent,
                    //     surfaceTintColor: Colors.transparent,
                    //     color: Colors.white,
                    //     // shape: RoundedRectangleBorder(
                    //     //     borderRadius: BorderRadius.circular(8),
                    //     //     side: const BorderSide()),
                    //     margin: const EdgeInsets.symmetric(
                    //         horizontal: 5, vertical: 8),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(top: 18),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Container(
                    //             width: 48,
                    //             height: 48,
                    //             decoration: const BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               image: DecorationImage(
                    //                 image: NetworkImage(
                    //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYLb4fHlPF-aw_5Ea494xaBQDJ7b6DOlY2ng&usqp=CAU'), // Replace with your image path
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ),
                    //           const SizedBox(height: 12),
                    //           const Text(
                    //             'More',
                    //             style: TextStyle(fontSize: 10),
                    //             textAlign: TextAlign.center,
                    //           ), // Display the option name
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  } else {
                    // final listItemIndex =
                    //     index < widget.totalVisibleOptions ? index : index - 1;
                    return buildOptionItem(index);
                  }
                }),
          ),
        ]);
  }
}
