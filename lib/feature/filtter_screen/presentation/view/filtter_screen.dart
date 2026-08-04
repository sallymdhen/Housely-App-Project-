import 'package:flutter/material.dart';

class FiltterScreen extends StatelessWidget {
  const FiltterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtter'),
      ),
      body: Center(
        child: Text('HELLO IN filtter screen'),
      ),
    );
  }
}