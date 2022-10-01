import 'package:flutter/material.dart';

class AllTransactions extends StatelessWidget {
  final List<ListItem> transactions;
  final String dateRange;

  const AllTransactions(
      {super.key,
      required this.transactions,
      required this.dateRange,
      required String title});

  @override
  Widget build(BuildContext context) {
    const title = "Transaction History";
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(title: const Text(title)),
          body: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];

              return ListTile(
                  title: transaction.buildTitle(context),
                  subtitle: transaction.buildSubtitle(context));
            },
          )),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

class transactionList extends StatelessWidget {
  final List<ListItem> transactions;
  final String dateRange;

  const transactionList(
      {super.key, required this.transactions, required this.dateRange});

  @override
  Widget build(BuildContext context) {
    const title = "Transaction History";
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(title: const Text(title)),
          body: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];

              return ListTile(
                  title: transaction.buildTitle(context),
                  subtitle: transaction.buildSubtitle(context));
            },
          )),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
