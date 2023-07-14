import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GridView Home'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              context.push('/gridview-home/payment-categories');
            },
            child: const Text('Payment Categories Component'),
          ),
        ),
      ),
    );
  }
}
