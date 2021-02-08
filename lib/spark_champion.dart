import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';


class SparkChampion extends SpriteAnimationComponent implements JoystickListener {
  final double speed = 159;
  double radAngle = 0;
  bool _move = false;
  double currentSpeed = 0;
  Rect _rect;

  SparkChampion.fromSpriteAnimation(size, animation) : super.fromSpriteAnimation(size, animation); 

  @override
  void update(double dt) {
    super.update(dt);
  
    if (_move) {
      moveFromAngle(dt);  
    }
  }

  @override
  void onGameResize(Vector2 size) {
    _rect = animation.currentFrame.sprite.src; 
    super.onGameResize(size);
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
      radAngle = event.radAngle;
      currentSpeed = speed * event.intensity;
    }
  }

  void moveFromAngle(double dtUpdate) {
    final double nextX = (currentSpeed * dtUpdate) * cos(radAngle);
    final double nextY = (currentSpeed * dtUpdate) * sin(radAngle);

    if (_rect == null) {
      return;
    }

    final Offset diffBase = Offset(
          _rect.center.dx + nextX,
          _rect.center.dy + nextY,
        ) -
        _rect.center;
        
    this.x = this.x + diffBase.dx; 
    this.y = this.y + diffBase.dy; 
  }
}
