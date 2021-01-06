import 'package:flutter/material.dart';

class NumberButton3 extends StatelessWidget {
  final VoidCallback activateButton3;
  NumberButton3(this.activateButton3);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 150,
      bottom: 380,
      child: GestureDetector(
        onTapUp: (TapUpDetails details) {
          //startGame();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/number_3.png',
            ),
          ),
        ),
      ),
    );
  }
}
