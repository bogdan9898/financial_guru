import 'package:financial_guru/categories_widget.dart';
import 'package:financial_guru/global_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralElementsWidget extends StatelessWidget {
  const GeneralElementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Center(
        child: ListView(
          children: <Widget>[CategoriesWidget()],
        ),
      ),
    );
  }
}
