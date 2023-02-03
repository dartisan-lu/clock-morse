import 'package:clock_morse/game.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenGame(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenGame extends StatefulWidget {
  @override
  _SplashScreenGameState createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame> {
  late FlameSplashController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        showBefore: (BuildContext context) {
          return const Text('Before logo');
        },
        showAfter: (BuildContext context) {
          return const Text('After logo');
        },
        theme: FlameSplashTheme.dark,
        onFinish: (context) => Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute(builder: (context) => MyGameWidget()),
        ),
      ),
    );
  }
}
