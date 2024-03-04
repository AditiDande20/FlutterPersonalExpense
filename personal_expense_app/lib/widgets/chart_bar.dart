import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double chartAmount;
  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.chartAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('₹${spendingAmount.toStringAsFixed(0)}')),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: 70,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: chartAmount,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        Text(label)
      ],
    );
  }
}
