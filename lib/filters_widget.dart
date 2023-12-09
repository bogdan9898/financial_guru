import 'package:financial_guru/tags_widget.dart';
import 'package:financial_guru/global_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          TagsWidget(),
          // CategoriesWidget(),
        ],
      ),
    );
  }
}
