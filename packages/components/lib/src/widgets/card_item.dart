import 'package:flutter/material.dart';
import 'package:components/src/model/option.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.optionIndex,
      required this.selectedIndex,
      required this.selectOption,
      required this.options});

  final int optionIndex;
  final int selectedIndex;
  final void Function(int) selectOption;
  final List<Option> options;

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == optionIndex;

    return GestureDetector(
      onTap: () {
        selectOption(optionIndex);
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
                        : options[optionIndex]
                            .icon), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                options[optionIndex].name,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ), // Display the option name
            ],
          ),
        ),
      ),
    );
  }
}
