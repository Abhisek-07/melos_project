import 'package:components/components.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.bankTransferComponent});

  final BankTransferComponent bankTransferComponent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Center(
        child: bankTransferComponent,
      ),
    );
  }
}
