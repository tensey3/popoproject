import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'ここにイベント機能を実装します',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}