import 'dart:math';

import 'package:flame/components/animation_component.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_events.dart';

class SparkChampion extends AnimationComponent implements JoystickListener {
  double speedX, speedY = 0; 
  double radAngle = 0;
  bool _move = false;

  SparkChampion(double x, double y)
      : super(
            40,
            40,
            Animation.sequenced("spark_champion_sheet.png", 7,
                stepTime: .2, textureWidth: 32, textureHeight: 32)) {
    this.x = x;
    this.y = y;
  }

  @override
  void update(double t) {
    super.update(t);
    if (_move) {
      x = x - speedX; 
      y = y - speedY; 
    }
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    // if (event.event == ActionEvent.DOWN) {
    //   if (event.id == 1) {
    //     _paint = _paint == _whitePaint ? _bluePaint : _whitePaint;
    //   }
    //   if (event.id == 2) {
    //     _paint = _paint == _whitePaint ? _greenPaint : _whitePaint;
    //   }
    // }
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    _move = event.directional != JoystickMoveDirectional.IDLE;
    if (_move) {
      switch (event.directional) {
        case JoystickMoveDirectional.MOVE_UP: speedX = 0; speedY = 1 * event.intensity; 
          break;
        case JoystickMoveDirectional.MOVE_UP_LEFT: speedX = .5 * event.intensity; speedY = .5 * event.intensity; 
          break;
        case JoystickMoveDirectional.MOVE_LEFT: speedX = 1 * event.intensity; speedY = 0; 
          break;
        case JoystickMoveDirectional.MOVE_DOWN_LEFT: speedX = .5 * event.intensity; speedY = -.5 * event.intensity; 
          break;
        case JoystickMoveDirectional.MOVE_DOWN: speedX = 0; speedY = -1 * event.intensity; 
          break;
        case JoystickMoveDirectional.MOVE_DOWN_RIGHT: speedX = -.5 * event.intensity; speedY = -.5 * event.intensity; 
          break;
        case JoystickMoveDirectional.MOVE_RIGHT: speedX = -1 * event.intensity; speedY = 0; 
          break;
        case JoystickMoveDirectional.MOVE_UP_RIGHT: speedX = -.5 * event.intensity; speedY = .5 * event.intensity; 
          break;
        default: speedX = 0; speedY = 0; 
      }
    }
  }
}
