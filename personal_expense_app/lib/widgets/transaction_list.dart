import 'package:flutter/material.dart';
import 'package:personal_expense_app/utils/utils.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  List<Transactions> transactionList = [];
  Function delete;
  TransactionList(
      {super.key, required this.transactionList, required this.delete});

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/empty.png',
                height: 200,
                width: 200,
              ),
              const Text(
                'No data added !!!',
                style: TextStyle(fontSize: 16),
              )
            ],
          )
        : Column(
            children: transactionList.map((tx) {
            return InkWell(
              onTap: () => delete(tx.id),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Card(
                  elevation: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                getDate(tx.date.toString()),
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: Text(
                            '₹ ${tx.amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList());
  }
}
