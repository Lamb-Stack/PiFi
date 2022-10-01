import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pi_fi/AllTransactions.dart';
import 'package:pi_fi/calendar.dart';
import 'package:pi_fi/pie_chart.dart';
import 'addTransaction.dart';
import 'chart_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naviation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(title: 'Welcome to PiFi'),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                child: const Text("View Transactions"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    side: BorderSide(color: Colors.black, width: 50),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                    )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AllTransactions();
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                child: const Text("Total Spending"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    side: BorderSide(color: Colors.black, width: 50),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                    )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyHomePage(
                      title: '',
                    );
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                child: const Text("Calendar"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    side: BorderSide(color: Colors.black, width: 50),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                    )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Calendar();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddTransaction();
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
