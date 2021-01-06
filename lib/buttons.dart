import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class NumberButtonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridButton(
      onPressed: (dynamic val) {
        /*...*/
      },
      items: [
        [
          GridButtonItem(child: ),
          GridButtonItem(child: Text("2")),
          GridButtonItem(title: "3", flex: 2),
        ],
        [
          GridButtonItem(title: "a", value: "100", longPressValue: "long"),
          GridButtonItem(title: "b", color: Colors.lightBlue)
        ],
      ],
    );
  }
}
