
import 'package:flame/components/component.dart';
import 'package:flame/components/joystick/joystick_action.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_directional.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flame/game.dart';
import 'dart:ui';

import 'package:spark_machine/jellyfish.dart';
import 'package:spark_machine/number_button_1.dart';
import 'package:spark_machine/number_button_2.dart';
import 'package:spark_machine/number_button_3.dart';
import 'package:spark_machine/number_button_4.dart';
import 'package:spark_machine/spark_champion.dart';
import 'package:spark_machine/spark_forest.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util(); 
  await flameUtil.fullScreen(); 
  await flameUtil.setOrientation(DeviceOrientation.portraitUp); 
  final size = await Flame.util.initialDimensions(); 

  SparkGame game = SparkGame(size); 
  runApp(game.widget);
}

class SparkGame extends BaseGame with HasWidgetsOverlay, MultiTouchDragDetector {
  Size size; 
  var personmanAnim; 
  SparkChampion player; 
  var joystick; 

  

  SparkGame(Size s) {
    this.size = s; 

    addWidgetOverlay("button_1", NumberButton1(_button1Clicked)); 
    addWidgetOverlay("button_2", NumberButton2(_button2Clicked)); 
    addWidgetOverlay("button_3", NumberButton3(_button3Clicked)); 
    addWidgetOverlay("button_4", NumberButton4(_button4Clicked)); 
    Sprite bgSprite = Sprite('background.png');
    SpriteComponent bg = SpriteComponent.fromSprite(size.width, size.height, bgSprite);

    add(bg);
    add(JellyFish(50, size.height)); 
    add(ForestSpark(32, 32));
    add(player = SparkChampion(size.width/2, size.height/2)); 

    joystick = JoystickComponent(
    directional: JoystickDirectional(margin: EdgeInsets.only(left: s.width * .8, bottom: s.height * .1)),
    actions: [
      // JoystickAction(
      //   actionId: 1,
      //   size: 50,
      //   margin: const EdgeInsets.all(50),
      //   color: const Color(0xFF0000FF),
      // ),
      // JoystickAction(
      //   actionId: 2,
      //   size: 50,
      //   color: const Color(0xFF00FF00),
      //   margin: const EdgeInsets.only(
      //     right: 50,
      //     bottom: 120,
      //   ),
      // ),
      // JoystickAction(
      //   actionId: 3,
      //   size: 50,
      //   margin: const EdgeInsets.only(bottom: 50, right: 120),
      //   enableDirection: true,
      // ),
    ],
  );
    

    joystick.addObserver(player);
    add(joystick); 
  }

  void _button1Clicked() {
  
  }
  void _button2Clicked() {
  
  }
  void _button3Clicked() {

  }
  void _button4Clicked() {
  
  }

  @override 
  void onReceiveDrag(DragEvent drag) {
    // TODO: implement onReceiveDrag
    joystick.onReceiveDrag(drag); 
    super.onReceiveDrag(drag);
  }

  
}
