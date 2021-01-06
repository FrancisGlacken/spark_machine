import 'package:flutter/material.dart';

class NumberButton4 extends StatelessWidget {
  final VoidCallback activateButton4;
  NumberButton4(this.activateButton4);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 150,
      bottom: 380,
      child: GestureDetector(
        onTapUp: (TapUpDetails details) {
          //startGame();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/number_4.png',
            ),
          ),
        ),
      ),
    );
  }
}
