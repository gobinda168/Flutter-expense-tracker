import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Transaction.dart';
import 'package:expense_tracker/widgets/addTransactions.dart';
import 'package:expense_tracker/widgets/transactionApp.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        title: "Shopping", amount: 1000, id: '1001', date: DateTime.now()),
    Transaction(
        title: "Rent",
        amount: 3500,
        id: '1002',
        date: DateTime.now().subtract(Duration(days: 8))),
    Transaction(
        title: "Gas",
        amount: 500,
        id: '1003',
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        title: "Electricity",
        amount: 3000,
        id: '1004',
        date: DateTime.now().subtract(Duration(days: 1))),
  ];
  void addNewTX(String title, double amount, DateTime date) {
    final nexTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date != null ? date : DateTime.now());
    setState(() {
      _transactions.add(nexTx);
    });
    Navigator.of(context).pop();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddTransaction(addNewTX),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionApp(
                recentTransactions: _recentTransactions,
                transactions: _transactions,
                removeTransaction: removeTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
