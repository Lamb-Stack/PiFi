import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    const transactionsTitle = "All Transactions";
    return MaterialApp(title: transactionsTitle);
  }
}

class transactions extends StatefulWidget {
  const transactions({super.key});

  @override
  State<transactions> createState() => _transactionsState();
}

class _transactionsState extends State<transactions> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
