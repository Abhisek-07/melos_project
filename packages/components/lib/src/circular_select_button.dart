import 'package:flutter/material.dart';

class CircularSelectButton extends StatelessWidget {
  const CircularSelectButton({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(width: 4, color: Colors.purple)
              : Border.all(width: 2, color: Colors.grey)),
    );
  }
}
