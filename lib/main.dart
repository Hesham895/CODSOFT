import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'expense_provider.dart';
import 'transaction_list.dart';
import 'add_transaction_form.dart';
import 'budget_display.dart'; // Ensure this import is correct

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: MaterialApp(
        title: 'Personal Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ExpenseHomePage(),
      ),
    );
  }
}

class ExpenseHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense Tracker'),
      ),
      body: Column(
        children: [
          BudgetDisplay(),
          Expanded(child: TransactionList()),
          AddTransactionForm(),
        ],
      ),
    );
  }
}
