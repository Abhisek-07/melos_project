import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BankTransferContainerComponent extends StatelessWidget {
  const BankTransferContainerComponent({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailingIcon,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  final String? trailingIcon;

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
                width: 8,
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
                          fontWeight: FontWeight.bold, fontSize: 14),
                      // softWrap: false,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              if (trailingIcon != null)
                SvgPicture.asset(
                  trailingIcon!,
                  width: 18,
                  height: 18,
                ),
              // Container(
              //   width: 18,
              //   height: 18,
              //   child: ,
              //   // constraints: const BoxConstraints(maxWidth: 18),
              //   // decoration: const BoxDecoration(
              //   //   shape: BoxShape.circle,
              //   //   image: DecorationImage(
              //   //     // fit: BoxFit.scaleDown,
              //   //     image: AssetImage('assets/downloads.svg'),
              //   //   ),
              //   // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
