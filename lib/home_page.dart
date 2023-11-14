import 'package:financial_guru/general_elements_widget.dart';
import 'package:financial_guru/overview_widget.dart';
import 'package:financial_guru/transactions_widget.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class CounterState extends ChangeNotifier {
  int count = 0;

  void incrementCounter() {
    count++;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var navBarSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var counterState = context.watch<CounterState>();
    // var count = counterState.count;

    Widget currentView;
    switch (navBarSelectedIndex) {
      case 0:
        currentView = OverviewWidget();
        break;
      case 1:
        currentView = GeneralElementsWidget();
        break;
      case 2:
        currentView = TransactionsWidget();
        break;
      default:
        throw UnimplementedError('Invalid nav bar index: $navBarSelectedIndex');
    }

    var mainContainer = ColoredBox(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: currentView,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: mainContainer,
            ),
          ),
          SafeArea(
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.assessment),
                  label: 'Overview',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Categories & Filters',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long),
                  label: 'Transactions',
                ),
              ],
              currentIndex: navBarSelectedIndex,
              onTap: (val) {
                setState(() {
                  navBarSelectedIndex = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
