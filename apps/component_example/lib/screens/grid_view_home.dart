import 'package:component_example/application_components/payment_categories.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.push('/gridview-home/payment-categories');
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return const PaymentCategories();
            //   },
            // ));
          },
          child: const Text('Payment Categories Component'),
        ),
      ),
    );
  }
}
