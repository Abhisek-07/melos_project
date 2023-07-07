import 'package:component_example/application_components/bank_user_component.dart';
import 'package:component_example/application_components/payment_categories.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // fontFamily: ,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        background: const Color.fromARGB(255, 253, 247, 253),
        seedColor: const Color.fromARGB(255, 95, 21, 152),
      ),
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My components examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const PaymentCategories();
                  },
                ));
              },
              child: const Text('Payment Categories Component'),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const BankUserComponent();
                  },
                ));
              },
              child: const Text('Bank User Component'),
            ),
          ],
        ),
      ),
    );
  }
}
