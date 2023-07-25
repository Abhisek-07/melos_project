import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:component_example/model/grid_option.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.isComingSoon,
    required this.isPinned,
    required this.onLongPress,
    this.shakeAnimationTime = 600,
    this.isAnimationEnabled = true,
    this.showAlert,
  }) : super(key: key);

  final String name;
  final String icon;
  final bool isComingSoon;
  final bool isPinned;
  final void Function() onLongPress;
  final int shakeAnimationTime;
  final bool isAnimationEnabled;
  final void Function()? showAlert;

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 10.0),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 10.0, end: -10.0),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -10.0, end: 0.0),
        weight: 1,
      ),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationTimer?.cancel();
    super.dispose();
  }

  void startAnimation() {
    _animationController.repeat();
    _animationTimer =
        Timer(Duration(milliseconds: widget.shakeAnimationTime), () {
      if (_animationController.isAnimating) {
        _animationController.reset();
      }
      // _animationController.reset();
      // _animationTimer!.cancel();
    });
  }

  void runAnimation() {
    if (_animationController.status == AnimationStatus.completed ||
        _animationController.status == AnimationStatus.dismissed) {
      startAnimation();
      widget.showAlert != null ? widget.showAlert!() : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * 3.1415926535 / 180.0,
          child: child,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 4,
            bottom: 8,
            left: 4,
            right: 4,
            child: Opacity(
              opacity: widget.isComingSoon ? 0.5 : 1,
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onLongPress: () {
                    !widget.isComingSoon
                        ? widget.onLongPress()
                        // gridNotifier.showBottomSheet(context, option)
                        : widget.isComingSoon && widget.isAnimationEnabled
                            ? runAnimation()
                            : null;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: widget.isComingSoon
                          ? Border.all(
                              color: const Color.fromARGB(255, 209, 209, 209))
                          : widget.isPinned
                              ? Border.all(
                                  color:
                                      const Color.fromARGB(255, 148, 94, 218))
                              : null,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          widget.icon,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: Text(
                            widget.name,
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.isComingSoon)
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Coming Soon',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          if (widget.isPinned)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 148, 94, 218),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: SvgPicture.asset('assets/icons/pin.svg'),
              ),
            ),
        ],
      ),
    );
  }
}
