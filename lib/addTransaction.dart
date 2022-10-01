import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'storageIO.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  AddTransactionState createState() {
    return AddTransactionState();
  }
}

class AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();

  final descController = TextEditingController();
  final catController = TextEditingController();
  final valController = TextEditingController();

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
                controller: descController,
                maxLength: 100,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Brief Description:',
                ),
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: catController,
                maxLength: 100,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Category:',
                ),
              ),
              TextFormField(
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    symbol: "\$",
                  )
                ],
                keyboardType: TextInputType.number,
                controller: valController,
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
                    writeContent(catController.text, descController.text,
                        valController.text);
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
