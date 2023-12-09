// import 'package:financial_guru/global_app_state.dart';
// import 'package:financial_guru/utils.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';

const List<String> months = <String>[
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
const int firstYear = 2023;
const int lastYear = 2100;

class ListTransactionsWidget extends StatefulWidget {
  const ListTransactionsWidget({super.key});

  @override
  State<ListTransactionsWidget> createState() => _ListTransactionsWidgetState();
}

class _ListTransactionsWidgetState extends State<ListTransactionsWidget> {
  late String selectedYear;
  late String selectedMonth;

  _ListTransactionsWidgetState() {
    DateTime now = DateTime.now();
    selectedYear = now.year.toString();
    selectedMonth = months[now.month - 1];
  }

  void searchTransaction() {
    print("~~~ WIP ~~~");
  }

  Future<void> selectYearAndMonth(BuildContext context) async {
    final DateTime? selected = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(firstYear),
      lastDate: DateTime(lastYear),
    );

    if (selected != null) {
      setState(() {
        selectedYear = selected.year.toString();
        selectedMonth = months[selected.month - 1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: () => selectYearAndMonth(context),
          child: const Text("Select month/year"),
        ),
        Text("[WIP] listing transactions for: $selectedYear $selectedMonth"),
      ],
    );
  }
}
