import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/bank-user-home');
        return false;
      },
      child: const Scaffold(
        // appBar: AppBar(
        //   title: Text('Final Screen'),
        // ),
        body: Center(
          child: Text('Thank You'),
        ),
      ),
    );
  }
}
