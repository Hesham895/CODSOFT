import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}

class ExpenseProvider with ChangeNotifier {
  List<Transaction> _transactions = [];
  double _monthlyBudget = 0.0;

  List<Transaction> get transactions => _transactions;
  double get monthlyBudget => _monthlyBudget;

  void setMonthlyBudget(double budget) {
    _monthlyBudget = budget;
    notifyListeners();
  }

  void addTransaction(String title, double amount, DateTime date, String category) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
      category: category,
    );
    _transactions.add(newTransaction);
    notifyListeners();
  }

  double get totalExpenses {
    return _transactions.fold(0.0, (sum, item) => sum + item.amount);
  }

  double get remainingBudget {
    return _monthlyBudget - totalExpenses;
  }
}
