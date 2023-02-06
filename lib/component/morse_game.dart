import 'package:clock_morse/component/arc_text.dart';
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
  late ArcText _arcText;
  String code = "";

  tap(String next) {
    code = code + next;
    _arcText.text = code;
  }

  @override
  Future<void> onLoad() async {
    add(MorseButton(size / 2, tap));

    var pos = size / 2;

    _text = TextComponent(
        text: "Push",
        textRenderer: regular,
        anchor: Anchor.center,
        position: pos
    );
    add(_text);
    _arcText = ArcText(code, 45.0, 80.0, 24.0, position: pos);
    add(_arcText);
  }
}
