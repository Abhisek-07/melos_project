import 'package:flutter/material.dart';

class BankTransferContainerComponent extends StatelessWidget {
  const BankTransferContainerComponent({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.showTrailingIcon = false,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  final bool showTrailingIcon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromARGB(102, 158, 158, 158),
              width: 1.0,
            ),
          ),

          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      // softWrap: false,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              if (showTrailingIcon)
                Container(
                  height: 16,
                  constraints: const BoxConstraints(maxWidth: 18),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('assets/more.png'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
