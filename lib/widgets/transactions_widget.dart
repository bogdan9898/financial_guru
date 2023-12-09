import 'package:financial_guru/global_app_state.dart';
import 'package:financial_guru/widgets/transactions__add__widget.dart';
import 'package:financial_guru/widgets/transactions__list__widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          AddTransactionsWidget(),
          // separator widget ???
          ListTransactionsWidget(),
        ],
      ),
    );

    // return Center(
    //   child: Text("transactions wip..."),
    //   // floatingActionButton: FloatingActionButton(
    //   //   backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    //   //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
    //   //   onPressed: () {
    //   //     print("adding transaction...");
    //   //   },
    //   //   tooltip: 'New transaction',
    //   //   child: const Icon(Icons.add),
    //   // ),
    // );
  }
}
