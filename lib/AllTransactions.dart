import 'package:flutter/material.dart';
import 'package:pi_fi/storageIO.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Transaction History";
    return FutureBuilder(
        future: readcontent(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) return Container(); // still loading
          // alternatively use snapshot.connectionState != ConnectionState.done
          final String? contents = snapshot.data;
          return Scaffold(
              appBar: AppBar(title: const Text(title)),
              body: Center(
                child: Text(contents!),
              ));
        });
  }
}
