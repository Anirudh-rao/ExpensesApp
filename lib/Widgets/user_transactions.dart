import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transcation.dart';
import 'transcation_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _UserTransactions = [
    Transaction(
        id: 't1', Title: 'New Shoes', Amount: 69.90, date: DateTime.now()),
    Transaction(id: 't2', Title: 'Groceries', Amount: 400, date: DateTime.now())
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      Title: txTitle,
      Amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    //To setState
    setState(() {
      //Add methid
      _UserTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TranscationList(_UserTransactions),
      ],
    );
  }
}
