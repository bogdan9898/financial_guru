import 'package:financial_guru/global_app_state.dart';
import 'package:financial_guru/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var globalState = context.watch<GlobalAppState>();
    var categories = globalState.categories;

    var grid = <Widget>[];
    for (var categ in categories) {
      Color color = colorHexToArgb(categ["color"]!);
      grid.add(
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              categ["name"]!,
              style: TextStyle(
                color: calcForegroundColor(color, 235),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: grid,
          ),
        ),
      ),
    );
  }
}
