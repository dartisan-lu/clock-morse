import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

class ArcBottomText extends PositionComponent {
  late String text;
  late TextPainter painter;
  late TextStyle style;
  final double radius;
  final double textRadius;
  final double textSize;

  ArcBottomText(this.text, this.radius, this.textRadius, this.textSize, {Vector2? position})
      : super(position: position) {
    painter = TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    style = TextStyle(
      color: const Color(0xffff0000),
      fontSize: textSize,
    );
  }

  @override
  void render(
    Canvas canvas, {
    Vector2? position,
    Vector2? size,
    Paint? overridePaint,
  }) {
    final x = 0.5 * (position?.x ?? 0.0);
    final y = 0.5 * (position?.y ?? 0.0);

    for (int i = 0; i < text.length; ++i) {
      final double angle = 1.40 - (i * 0.25) + (text.length / 2 * 0.25);
      final double dx = cos(angle) * textRadius;
      final double dy = sin(angle) * textRadius;

      canvas.save();
      canvas.translate(x + dx, y + dy);
      canvas.rotate(angle - pi / 2);

      painter.text = TextSpan(text: text[i], style: style);
      painter.layout();

      painter.paint(canvas, Offset(-painter.width / 2, -painter.height / 2));
      canvas.restore();
    }
  }
}
