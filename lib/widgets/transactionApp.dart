import 'package:expense_tracker/models/Transaction.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class TransactionApp extends StatelessWidget {
  final List<Transaction> transactions;
  final List<Transaction> recentTransactions;
  final Function removeTransaction;

  TransactionApp(
      {this.transactions, this.recentTransactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Chart(recentTransactions),
        TransactionList(transactions, removeTransaction)
      ],
    );
  }
}
