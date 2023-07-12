import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BankUserHome extends StatelessWidget {
  const BankUserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank User Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.push('/bank-user-home/bank-user');
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return const PaymentCategories();
            //   },
            // ));
          },
          child: const Text('Bank User Component'),
        ),
      ),
    );
  }
}
