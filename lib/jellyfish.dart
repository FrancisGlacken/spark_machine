import 'package:flame/components/sprite_animation_component.dart';
import 'package:flame/sprite_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:vector_math/vector_math_64.dart';

class JellyFish extends SpriteAnimationComponent {
  JellyFish(Vector2 size, SpriteAnimation animation) : super(size, animation);


  @override
  void update(double t) {
    super.update(t); 
    y -= 15 * t; 
  }

void onTapDown(TapDownDetails d) {
    print("jelly tapped");
  }
}

