import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingScreen extends StatelessWidget {
  const ShimmerLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Shimmer.fromColors(
          baseColor: Colors.grey.shade300, // Set your desired base color
          highlightColor:
              Colors.grey.shade100, // Set your desired highlight color
          child: Container(
            width: double.infinity,
            height: kToolbarHeight + MediaQuery.of(context).viewPadding.top,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300, // Set your desired base color
              highlightColor: const Color.fromARGB(
                  255, 17, 15, 15), // Set your desired highlight color
              child: Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.all(16),
                color: Colors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300, // Set your desired base color
              highlightColor:
                  Colors.grey.shade100, // Set your desired highlight color
              child: Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.all(16),
                color: Colors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300, // Set your desired base color
              highlightColor:
                  Colors.grey.shade100, // Set your desired highlight color
              child: Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.all(16),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
