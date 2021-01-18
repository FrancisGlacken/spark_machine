import 'dart:ui';

import 'package:flame/components/sprite_animation_component.dart';
import 'package:flame/sprite_animation.dart';
import 'package:vector_math/vector_math_64.dart';

class ForestSpark extends SpriteAnimationComponent {
  Vector2 size = new Vector2(1, 1); 
  Image image; 
  List<double> theStepTimes = [1, 1, 1]; 
  SpriteAnimationData data = new SpriteAnimationData.variable(
    amount: 3,
    stepTimes: [1, 1, 1],
    textureSize: Vector2(16, 16)
  );

  //ForestSpark(Vector2 size, SpriteAnimation animation) : super(size, animation);
  
  ForestSpark.fromFrameData(this.size, this.image, this.data) : super.fromFrameData(size, image, data);

  
  

  // ForestSpark(double x, double y)
  //     : super(
  //           40,
  //           40,
  //           Animation.sequenced("spark_forest_sheet.png", 3,
  //               stepTime: .33, textureWidth: 36, textureHeight: 36)) {
  //   this.x = x;
  //   this.y = y;
  // }

  @override
  void update(double t) {
    
    super.update(t);
  }
}
