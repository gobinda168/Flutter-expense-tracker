import 'package:expense_tracker/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;
  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 380,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(0)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  '${transactions[index].title}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    "${DateFormat.yMMMd().format(transactions[index].date)}"),
                trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      removeTransaction(transactions[index].id);
                    }),
              ),
            ));
          },
          itemCount: transactions.length,
        ));
  }
}
