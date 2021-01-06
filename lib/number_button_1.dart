import 'package:flutter/material.dart';

class NumberButton1 extends StatelessWidget {
  
  final VoidCallback _button1Clicked;
  NumberButton1(this._button1Clicked);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 150,
      top: 380,
      child: GestureDetector(
        onTapUp: (TapUpDetails details) {
          //startGame();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/number_1.png',
            ),
          ),
        ),
      ),
    );
  }
}
