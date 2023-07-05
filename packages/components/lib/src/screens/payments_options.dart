import 'package:components/src/widgets_payments_component/card_item.dart';
import 'package:components/src/widgets_payments_component/more.dart';
import 'package:flutter/material.dart';
// import '../../../../../apps/component_example/lib/model/option.dart';

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

  @override
  Widget build(BuildContext context) {
    print(widget.options);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              // fontWeight: FontWeight.bold,
            ),
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
                      // iconUrl:
                      //     'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/more-512.png',
                      selectMore: widget.selectMore,
                    );
                  } else {
                    final option = widget.options[index];
                    // final listItemIndex =
                    //     index < widget.totalVisibleOptions ? index : index - 1;
                    return CardItem(
                      optionIndex: index,
                      // options: widget.options,
                      selectedIndex: widget.selectedIndex,
                      selectOption: widget.selectOption,
                      cardName: option.name,
                      iconUrl: option.icon,
                    );
                  }
                }),
          ),
        ]);
  }
}

class Option {
  final String name;
  final String icon;

  Option({
    required this.name,
    required this.icon,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      name: json['name'],
      icon: json['icon'],
    );
  }
}
