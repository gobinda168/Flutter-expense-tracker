import 'package:expense_tracker/models/Transaction.dart';
import 'package:expense_tracker/widgets/chartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalAmount
      };
    });
  }

  double get spendingPercentage {
    return groupedTransaction.fold(
        0.0, (previousValue, element) => previousValue += element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransaction
                    .map((e) => Flexible(
                          fit: FlexFit.tight,
                          child: ChartBar(
                            label: e['day'],
                            spendingPerDay: e['amount'],
                            spendingPercentage: spendingPercentage == 0
                                ? 0
                                : (e['amount'] as double) / spendingPercentage,
                          ),
                        ))
                    .toList()),
          ),
        ));
  }
}
