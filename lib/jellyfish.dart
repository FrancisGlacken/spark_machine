import 'package:flame/components/animation_component.dart';
import 'package:flame/animation.dart';
import 'package:flutter/gestures.dart';


class JellyFish extends AnimationComponent {
  JellyFish(double x, double y) : super(24, 24, 
      Animation.sequenced("sprite_sheet_jellyfish.png", 10, textureWidth: 16, textureHeight: 16)){
        
      this.x = x;
      this.y = y;
  }

  @override
  void update(double t) {
    super.update(t); 
    y -= 15 * t; 
  }

void onTapDown(TapDownDetails d) {
    print("jelly tapped");
  }
}

