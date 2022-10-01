import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

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
    String description;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Transaction"),
      ),
      key: _formKey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                // The validator receives the text that the user has entered.
                maxLength: 100,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Brief Description:',
                ),
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                maxLength: 100,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Category:',
                ),
              ),
              TextFormField(
                inputFormatters: [CurrencyTextInputFormatter()],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Amount:',
                  hintText: "0.00",
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
        ),
      ),
    );
  }
}
