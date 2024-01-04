import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expenses.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expenses expenses) onRemoveExpense;
  final List<Expenses> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                ),
              ),
              child: ExpenseItem(expenses[index]),
            ));
  }
}
