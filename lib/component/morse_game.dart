import 'package:clock_morse/component/arc_bottom_text.dart';
import 'package:clock_morse/component/morse_button.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

import '../data/morse_code.dart';
import 'arc_top_text.dart';

final style = TextStyle(color: BasicPalette.red.color, fontSize: 48);
final regular = TextPaint(style: style);

class MorseGame extends FlameGame with HasTappableComponents {
  late TextComponent _text;
  late ArcTopText _arcTextTop;
  late ArcBottomText _arcTextBottom;
  String code = '';
  String decode = '';

  Duration duration = const Duration(seconds: 2);
  async.Timer? timer;

  var a2c = morseCode;
  var c2a = Map.fromEntries(morseCode.entries.map((e) => MapEntry(e.value, e.key)));

  tap(String next) {
    code = code + next;

    timer?.cancel();
    timer = async.Timer(duration, () async {
      if (c2a.containsKey(code)) {
        decode = decode + c2a[code]!;
      }
      code = '';
      _arcTextBottom.text = decode;
      _arcTextTop.text = code;
    });

    _arcTextTop.text = code;
    _arcTextBottom.text = decode;
  }

  @override
  Future<void> onLoad() async {
    add(MorseButton(size / 2, tap));

    var pos = size / 2;

    _text = TextComponent(text: "Push", textRenderer: regular, anchor: Anchor.center, position: pos);
    add(_text);
    _arcTextTop = ArcTopText(code, 45.0, 80.0, 62.0, position: pos);
    _arcTextBottom = ArcBottomText(code, 45.0, 80.0, 24.0, position: pos);
    add(_arcTextTop);
    add(_arcTextBottom);
  }
}
