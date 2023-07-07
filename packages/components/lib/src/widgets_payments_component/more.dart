import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key, this.iconUrl, required this.selectMore});

  final String? iconUrl;
  final void Function() selectMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectMore,
      child: Card(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        color: Colors.white,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8),
        //     side: const BorderSide()),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   width: 48,
              //   height: 48,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     image: DecorationImage(
              //       image: NetworkImage(iconUrl ??
              //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYLb4fHlPF-aw_5Ea494xaBQDJ7b6DOlY2ng&usqp=CAU'), // Replace with your image path
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              if (iconUrl != null)
                CircularBankIcon.svg(
                  svgIcon: iconUrl!,
                  // isMore: true,
                  linearGradientColors: moreGradientColors,
                )
              else
                CircularBankIcon.network(
                    networkUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYLb4fHlPF-aw_5Ea494xaBQDJ7b6DOlY2ng&usqp=CAU'),
              const SizedBox(height: 8),
              const Text(
                'More',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ), // Display the option name
            ],
          ),
        ),
      ),
    );
  }
}
