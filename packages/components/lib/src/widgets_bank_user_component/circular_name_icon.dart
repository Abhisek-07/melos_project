import 'package:utils/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class CircularNameIcon extends StatelessWidget {
  const CircularNameIcon({
    super.key,
    required this.name,
    this.size = IconSize.medium,
    this.linearGradientColors,
    // this.index,
  });

  final String name;
  final IconSize size;
  final List<Color>? linearGradientColors;
  // final int? index;

  // final List<List<Color>> gradientColors = [
  //   [
  //     const Color.fromARGB(255, 225, 201, 255),
  //     const Color.fromARGB(255, 165, 117, 227)
  //   ],
  //   [
  //     const Color.fromARGB(255, 215, 193, 190),
  //     const Color.fromARGB(255, 251, 244, 243)
  //   ],
  // ];

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
            gradient: LinearGradient(
                colors: linearGradientColors ?? gradientColorsForNameIcon[0],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)
            // index == null || index! % gradientColors.length == 0
            //     ? LinearGradient(
            //         colors: gradientColors[0],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //       )
            //     : LinearGradient(
            //         colors: gradientColors[1],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //       ),
            ),
        child: Center(
          child: Text(
            name.getInitials(name),
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
