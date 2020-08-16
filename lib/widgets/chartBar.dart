import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingPerDay;
  final double spendingPercentage;
  ChartBar({this.label, this.spendingPerDay, this.spendingPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FittedBox(child: Text('\$${spendingPerDay.toStringAsFixed(0)}')),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 60,
            width: 20,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                    // borderRadius: BorderRadius.circular(10)
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      color: Colors.black,
                      // borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(label)
        ],
      ),
    );
  }
}
