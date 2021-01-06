import 'package:flame/components/animation_component.dart';
import 'package:flame/animation.dart';

class ForestSpark extends AnimationComponent {
  ForestSpark(double x, double y)
      : super(
            40,
            40,
            Animation.sequenced("spark_forest_sheet.png", 3,
                stepTime: .33, textureWidth: 36, textureHeight: 36)) {
    this.x = x;
    this.y = y;
  }

  @override
  void update(double t) {
    
    super.update(t);
  }
}
