import 'package:financial_guru/global_app_state.dart';
import 'package:financial_guru/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var globalState = context.watch<GlobalAppState>();
    var tags = globalState.tags;

    var grid = <Widget>[];
    for (var tag in tags) {
      Color color = colorHexToArgb(tag["color"]!);
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
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tag["name"]!,
              style: TextStyle(
                color: calcForegroundColor(color, 235),
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
              width: 2.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
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
        ),
        Positioned(
          left: 40,
          top: 6,
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 0,
              left: 10,
              right: 10,
            ),
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Text(
              'Tags',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}
