import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'expense_provider.dart';

class BudgetDisplay extends StatefulWidget {
  @override
  _BudgetDisplayState createState() => _BudgetDisplayState();
}

class _BudgetDisplayState extends State<BudgetDisplay> {
  final _budgetController = TextEditingController();

  void _setBudget() {
    final enteredBudget = double.tryParse(_budgetController.text) ?? 0.0;
    if (enteredBudget <= 0) {
      return;
    }

    Provider.of<ExpenseProvider>(context, listen: false).setMonthlyBudget(enteredBudget);
    _budgetController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, child) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monthly Budget: \$${expenseProvider.monthlyBudget.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Remaining Budget: \$${expenseProvider.remainingBudget.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              TextField(
                controller: _budgetController,
                decoration: InputDecoration(labelText: 'Set Monthly Budget'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Set Budget'),
                onPressed: _setBudget,
              ),
            ],
          ),
        );
      },
    );
  }
}
