import 'package:flutter/material.dart';

class CircularNameIcon extends StatelessWidget {
  const CircularNameIcon({
    super.key,
    required this.name,
    this.size = 'medium',
    required this.backgroundColor,
  });

  final String name;
  final String size;
  final Color backgroundColor;

  double _getSizeValue() {
    switch (size) {
      case 'low':
        return 32;
      case 'medium':
        return 48;
      case 'high':
        return 64;
      default:
        return 48;
    }
  }

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
    final double radius = _getSizeValue() / 2;

    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      child: ClipOval(
        child: Text(
          _getInitials(),
          style: TextStyle(
            color: Colors.black,
            fontSize: radius * 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
