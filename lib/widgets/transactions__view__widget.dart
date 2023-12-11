import 'package:flutter/material.dart';

class ViewTransactions extends StatefulWidget {
  final List transactions;
  final bool editable;
  const ViewTransactions({
    super.key,
    required this.transactions,
    required this.editable,
  });

  @override
  State<ViewTransactions> createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
