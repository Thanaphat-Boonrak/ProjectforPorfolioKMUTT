import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Expense();
  }
}

class _Expense extends State<Expense> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => Newexpense(
              onAddExpense: _addExpense,
            ));
  }

  final List<Expenses> _registerExpenses = [
    Expenses(
        title: "Flutter Course",
        amount: 19.90,
        date: DateTime.now(),
        category: Category.travel),
    Expenses(
        title: "Food Course",
        amount: 9.90,
        date: DateTime.now(),
        category: Category.food),
  ];
  void _addExpense(Expenses expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expenses expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Expense delete'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter ExpenseTrack'), actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ]),
        body: width < 600
            ? Column(children: [
                Chart(expenses: _registerExpenses),
                Expanded(
                  child: mainContent,
                ),
              ])
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registerExpenses)),
                  Expanded(
                    child: mainContent,
                  )
                ],
              ));
  }
}
