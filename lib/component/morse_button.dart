import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class MorseButton extends CircleComponent with TapCallbacks {
  static Paint red = BasicPalette.red.paint();
  static Paint blue = BasicPalette.blue.paint();
  var _char = '';
  final Function(String) onTap;

  MorseButton(Vector2 position, this.onTap) : super(
    position: position,
    radius: 60.0,
    anchor: Anchor.center,
  );

  @override
  void onTapDown(TapDownEvent event) {
    event.handled = true;
    _char = '·';
  }

  @override
  void onLongTapDown(TapDownEvent event) {
    event.handled = true;
    _char = '-';
  }

  @override
  void onTapUp(TapUpEvent event) {
    event.handled = true;
    onTap(_char);
  }
}
