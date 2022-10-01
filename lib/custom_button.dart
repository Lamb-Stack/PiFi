import 'package:flutter/material.dart';
import 'package:pi_fi/AllTransactions.dart';
import 'package:pi_fi/calendar.dart';
import 'addTransaction.dart';
import 'chart_view.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Calendar();
              }));
            },
            child: Text("Calendar")));
  }
}
