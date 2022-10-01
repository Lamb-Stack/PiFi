import 'package:flutter/material.dart';
import 'package:moneytextformfield/moneytextformfield.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  AddTransactionState createState() {
    return AddTransactionState();
  }
}

class AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              return (value != null && value.length < 101)
                  ? 'Over 100 characters'
                  : null;
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Brief Description:',
            ),
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              return (value != null && value.length < 101)
                  ? 'Over 100 characters'
                  : null;
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Category:',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                Navigator.pop(context);
              },
              child: const Text('Enter Transaction'),
            ),
          ),
        ],
      ),
    );
  }
}
