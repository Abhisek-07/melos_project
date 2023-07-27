import 'package:components/components.dart';
import 'package:utils/utils.dart';
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
    required this.appTheme,
  });

  final List<OptionItem> options;
  final int totalVisibleOptions;
  final void Function(int) selectOption;
  final int selectedIndex;
  final void Function() selectMore;
  final String title;
  final AppTheme appTheme;

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
                      iconUrl: 'assets/icons/more_icon.svg',
                      // iconUrl:
                      //     'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/more-512.png',
                      selectMore: () {
                        widget.selectMore();
                      },
                    );
                  } else {
                    final option = widget.options[index];

                    return CardItem(
                      appTheme: widget.appTheme,
                      isSelected: index == widget.selectedIndex,
                      selectOption: () {
                        widget.selectOption(index);
                      },
                      cardName: option.name,
                      iconUrl: option.icon,
                      selectedIconUrl: 'assets/icons/check.svg',
                      iconGradientColors:
                          index % gradientColorsForBankIcon.length == 0
                              ? gradientColorsForBankIcon[0]
                              : index % gradientColorsForBankIcon.length == 1
                                  ? gradientColorsForBankIcon[1]
                                  : gradientColorsForBankIcon[2],
                    );
                  }
                }),
          ),
        ]);
  }
}

class OptionItem {
  final String name;
  final String icon;

  OptionItem({
    required this.name,
    required this.icon,
  });
}
