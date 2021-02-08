
import 'package:flame/components.dart';
import 'package:flame/gestures.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:spark_machine/jellyfish.dart';

import 'package:spark_machine/number_button_1.dart';
import 'package:spark_machine/number_button_2.dart';
import 'package:spark_machine/number_button_3.dart';
import 'package:spark_machine/number_button_4.dart';
import 'package:spark_machine/spark_champion.dart';
import 'package:spark_machine/spark_forest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  final game = SparkGame();
  runApp(GameWidget(
    game: game,
  ));
}

class SparkGame extends BaseGame with MultiTouchDragDetector {
  var personmanAnim;
  SparkChampion championComponent;
  JellyFish jellyfish;
  var joystick;
  //Image championImage, bgImage, jellyfishImage;
  //SpriteAnimation championAnim, jellyfishAnim;
  SpriteComponent bgComponent;

  @override
  Future<void> onLoad() async {
    final bgImage = await images.load('background.png');
    final championImage = await images.load('spark_champion_sheet.png');
    final jellyfishImage = await images.load('sprite_sheet_jellyfish.png');
    final forestImage = await images.load('spark_forest_sheet.png');
    final spriteSize = Vector2.all(100.0);


    final championAnim = SpriteAnimation.fromFrameData(
      championImage,
      SpriteAnimationData.sequenced(
        amount: 7,
        textureSize: Vector2.all(32),
        stepTime: 0.15,
        loop: true,
      ),
    );

    final forestAnim = SpriteAnimation.fromFrameData(
      forestImage,
      SpriteAnimationData.sequenced(
        amount: 3,
        textureSize: Vector2.all(36),
        stepTime: 0.15,
        loop: true,
      ),
    );

    final jellyfishAnim = SpriteAnimation.fromFrameData(
        jellyfishImage,
        SpriteAnimationData.sequenced(
          amount: 10,
          textureSize: Vector2.all(16),
          stepTime: 0.15,
          loop: true,
        ));

    championComponent = SparkChampion.fromSpriteAnimation(spriteSize, championAnim);
    championComponent.x = size.x / 2 - spriteSize.x;
    championComponent.y = spriteSize.y;

    joystick = JoystickComponent(
      directional: JoystickDirectional(
          margin: EdgeInsets.only(left: size.x * .8, bottom: size.y * .1)),
    );

    final forestComponent = ForestSpark.fromSpriteAnimation(spriteSize, forestAnim);
    forestComponent.x = size.x / 2 - spriteSize.x;
    forestComponent.y = size.y - 40;

    jellyfish = JellyFish.fromSpriteAnimation(Vector2.all(32), jellyfishAnim);
    bgComponent = SpriteComponent.fromImage(Vector2(size.x, size.y), bgImage);
    add(bgComponent);
    joystick.addObserver(championComponent);
    add(joystick);
    add(championComponent);
    add(forestComponent); 
  }

  SparkGame() {
    // addWidgetOverlay("button_1", NumberButton1(_button1Clicked));
    // addWidgetOverlay("button_2", NumberButton2(_button2Clicked));
    // addWidgetOverlay("button_3", NumberButton3(_button3Clicked));
    // addWidgetOverlay("button_4", NumberButton4(_button4Clicked));
    //add(ForestSpark.fromFrameData(null, null, null));
    //add(jellyfish);
  }

  void _button1Clicked() {}
  void _button2Clicked() {}
  void _button3Clicked() {}
  void _button4Clicked() {}

  @override
  void onReceiveDrag(DragEvent drag) {
    // TODO: implement onReceiveDrag
    joystick.onReceiveDrag(drag);
    super.onReceiveDrag(drag);
  }
}
