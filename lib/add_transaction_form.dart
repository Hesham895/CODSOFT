import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'expense_provider.dart';

class AddTransactionForm extends StatefulWidget {
  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0.0;
    final enteredCategory = _categoryController.text;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredCategory.isEmpty) {
      return;
    }

    Provider.of<ExpenseProvider>(context, listen: false).addTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
      enteredCategory,
    );

    _titleController.clear();
    _amountController.clear();
    _categoryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: 'Category'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Add Transaction'),
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}
