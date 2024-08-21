import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'expense_provider.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, child) {
        return ListView.builder(
          itemCount: expenseProvider.transactions.length,
          itemBuilder: (context, index) {
            final transaction = expenseProvider.transactions[index];
            return ListTile(
              title: Text(transaction.title),
              subtitle: Text(transaction.category),
              trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
            );
          },
        );
      },
    );
  }
}
