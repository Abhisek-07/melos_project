import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

// enum CircularNameIconSize { low, medium, high }

class CircularNameIcon extends StatelessWidget {
  CircularNameIcon({
    super.key,
    required this.name,
    this.size = IconSize.medium,
    this.index,
    // required this.backgroundColor,
  });

  final String name;
  final IconSize size;
  final int? index;
  // final Color backgroundColor;

  final List<List<Color>> gradientColors = [
    [
      const Color.fromARGB(255, 225, 201, 255),
      const Color.fromARGB(255, 165, 117, 227)
    ],
    [
      const Color.fromARGB(255, 215, 193, 190),
      const Color.fromARGB(255, 251, 244, 243)
    ],
  ];

  // double _getSizeValue() {
  //   switch (size) {
  //     case CircularNameIconSize.low:
  //       return 32;
  //     case CircularNameIconSize.medium:
  //       return 48;
  //     case CircularNameIconSize.high:
  //       return 64;
  //     default:
  //       return 48;
  //   }
  // }

  String _getInitials() {
    List<String> nameParts = name.split(' ');
    if (nameParts.length >= 2) {
      int lastPart = nameParts.length - 1;
      return nameParts[0][0].toUpperCase() +
          nameParts[lastPart][0].toUpperCase();
    } else if (nameParts.length == 1 && nameParts[0].length >= 2) {
      return nameParts[0][0].toUpperCase() + nameParts[0][1].toUpperCase();
    } else if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double radius = getIconSize(size) / 2;

    return CircleAvatar(
      // backgroundColor: backgroundColor,
      radius: radius,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: index != null && index! % 2 != 0
              ? LinearGradient(
                  colors: gradientColors[1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: gradientColors[0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Center(
          child: Text(
            _getInitials(),
            style: TextStyle(
              color: Colors.black,
              fontSize: radius * 0.8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
