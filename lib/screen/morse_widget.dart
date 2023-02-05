import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../component/morse_game.dart';

class MorseWidget extends StatelessWidget {
  final game = MorseGame();
  
  MorseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }
}

