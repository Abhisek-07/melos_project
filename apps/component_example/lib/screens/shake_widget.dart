import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math';

class RotatingShakeWidget extends HookWidget {
  const RotatingShakeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final animation = useAnimation(
      TweenSequence([
        TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: 15.0),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 15.0, end: -15.0),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: -15.0, end: 0.0),
          weight: 1,
        ),
      ]).animate(animationController),
    );

    // int repeatCount = 0;

    Timer? animationTimer; // Timer variable to control the animation duration

    void _startAnimation() {
      // repeatCount = 0;
      // animationController.forward(from: 0.0);
      animationController.repeat();
      animationTimer = Timer(const Duration(seconds: 1), () {
        // animationController.stop();
        animationController.reset();
        animationTimer!.cancel();
        // Stop the animation after 3 seconds
      });
    }

    // useEffect(() {
    //   animationController.addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       repeatCount++;
    //       if (repeatCount < 2) {
    //         // Timer(const Duration(milliseconds: 500), () {
    //         animationController.reset();
    //         animationController.forward(from: 0.0);
    //         // });
    //       } else {
    //         repeatCount = 0;
    //       }
    //     }
    //   });
    // }, []);

    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          if (animationController.status == AnimationStatus.completed ||
              animationController.status == AnimationStatus.dismissed) {
            _startAnimation();
          }
        },
        // animationController.isAnimating ? null : _handleTap,

        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.rotate(
              angle: animation * 3.1415926535 / 180.0,
              child: child,
            );
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Shaking Widget',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
