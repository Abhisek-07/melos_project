import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:utils/utils.dart';

class CircularBankIcon extends StatelessWidget {
  CircularBankIcon({
    super.key,
    required this.bankIcon,
    this.size = IconSize.medium,
  })  : networkUrl = '',
        svgIcon = '',
        index = null,
        isMore = false,
        isSelected = false;

  CircularBankIcon.network({
    super.key,
    required this.networkUrl,
    this.size = IconSize.medium,
  })  : bankIcon = '',
        svgIcon = '',
        index = null,
        isMore = false,
        isSelected = false;

  CircularBankIcon.svg({
    super.key,
    required this.svgIcon,
    this.size = IconSize.medium,
    this.index,
    this.isMore = false,
    this.isSelected = false,
  })  : bankIcon = '',
        networkUrl = '';

  final String bankIcon;
  final IconSize size;
  final String networkUrl;
  final String svgIcon;
  final int? index;
  final bool isMore;
  final bool isSelected;

  final List<List<Color>> gradientColors = [
    [
      const Color.fromARGB(255, 225, 201, 255),
      const Color.fromARGB(255, 165, 117, 227)
    ],
    [
      const Color.fromARGB(255, 215, 193, 190),
      const Color.fromARGB(255, 251, 244, 243)
    ],
    [
      const Color.fromARGB(255, 215, 190, 243),
      const Color.fromARGB(255, 242, 236, 251)
    ]
  ];
  final List<Color> moreGradientColors = [
    const Color.fromARGB(255, 241, 241, 241),
    const Color.fromARGB(255, 241, 241, 241),
  ];
  final List<Color> checkGradientColors = [
    const Color.fromARGB(255, 54, 16, 101),
    const Color.fromARGB(255, 85, 40, 140),
    const Color.fromARGB(255, 114, 72, 168),
    const Color.fromARGB(255, 160, 112, 222),
    const Color.fromARGB(255, 196, 151, 255),
  ];

  @override
  Widget build(BuildContext context) {
    final double radius = getIconSize(size) / 2;

    if (networkUrl.isNotEmpty) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        backgroundImage: NetworkImage(networkUrl),
      );
    } else if (svgIcon.isNotEmpty) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        child: Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isSelected
                ? LinearGradient(
                    colors: checkGradientColors,
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )
                : isMore
                    ? LinearGradient(colors: moreGradientColors)
                    : (index == null || index! % gradientColors.length == 0)
                        ? LinearGradient(
                            colors: gradientColors[0],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        : (index! % gradientColors.length == 1)
                            ? LinearGradient(
                                colors: gradientColors[1],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                            : LinearGradient(
                                colors: gradientColors[2],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
          ),
          child: Center(
            child: SvgPicture.asset(svgIcon),
          ),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        backgroundImage: AssetImage(bankIcon),
      );
    }

    // return networkUrl.isNotEmpty
    //     ? CircleAvatar(
    //         backgroundColor: Colors.transparent,
    //         radius: radius,
    //         backgroundImage: NetworkImage(networkUrl),
    //       )
    //     : CircleAvatar(
    //         backgroundColor: Colors.transparent,
    //         radius: radius,
    //         backgroundImage: AssetImage(bankIcon),
    //       );
  }
}
