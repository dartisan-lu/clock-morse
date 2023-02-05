import 'package:clock_morse/component/morse_button.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

final style = TextStyle(color: BasicPalette.red.color, fontSize: 48);
final regular = TextPaint(style: style);

class MorseGame extends FlameGame with HasTappableComponents {
  late TextComponent _text;
  String code = "";

  tap(String next) {
    code = code + next;
    _text.text = code;
  }

  @override
  Future<void> onLoad() async {
    add(MorseButton(size / 2, tap));

    _text = TextComponent(
        text: code,
        textRenderer: regular,
        anchor: Anchor.center,
        position: size / 2
    );

    add(_text);
  }
}
