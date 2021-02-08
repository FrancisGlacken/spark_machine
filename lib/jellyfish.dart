import 'package:flame/components.dart';
import 'package:flutter/gestures.dart';
import 'package:vector_math/vector_math_64.dart';

class JellyFish extends SpriteAnimationComponent {
  JellyFish.fromSpriteAnimation(size, animation) : super.fromSpriteAnimation(size, animation); 


  @override
  void update(double t) {
    super.update(t); 
    y -= 15 * t; 
  }

void onTapDown(TapDownDetails d) {
    print("jelly tapped");
  }
}

