import 'package:component_example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 2500), // Adjust the duration as per your requirement.
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // After the animation is complete, navigate to the next screen.
        context.go('/home');
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: themeNotifier.appTheme.appDefaults.brandPrime,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final double opacityValue =
                Curves.easeOut.transform(_controller.value);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: opacityValue,
                  // _controller.value.clamp(0.0, 1.0),
                  child: Image.asset(
                      'assets/brand_icon_light.png'), // Replace with your image path.
                ),
                const SizedBox(
                  height: spacing16,
                ),
                Opacity(
                  opacity: opacityValue,
                  //  _controller.value.clamp(0.0, 1.0),
                  child: Image.asset(
                      'assets/brand_text_light.png'), // Replace with your image path.
                ),
                // Opacity(
                //   opacity: _controller.value.clamp(0.0, 1.0),
                //   child: const Text(
                //     'OPEN',
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Color.fromARGB(255, 146, 48, 170),
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
