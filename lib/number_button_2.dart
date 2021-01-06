import 'package:flutter/material.dart';

class NumberButton2 extends StatelessWidget {
  final VoidCallback activateButton2;
  NumberButton2(this.activateButton2);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 150,
      top: 380,
      child: GestureDetector(
        onTapUp: (TapUpDetails details) {
          //startGame();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/number_2.png',
            ),
          ),
        ),
      ),
    );
  }
}
