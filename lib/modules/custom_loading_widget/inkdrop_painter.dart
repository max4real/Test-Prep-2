import 'dart:math' as math;
import 'package:flutter/material.dart';

class InkDropPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color trackColor;

  InkDropPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final scale = size.width / 80.0;
    final trackStrokeWidth = 15 * scale;
    final fillStrokeWidth = 14 * scale;
    final ballRadius = 7 * scale;
    final radiusOffset = 5 * scale;
    final liftHeight = 35.0 * scale;

    final trackPaint =
        Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackStrokeWidth
          ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - radiusOffset, trackPaint);

    final fillPaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = fillStrokeWidth
          ..strokeCap = StrokeCap.round;

    final dropPaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    // progress 0 -> 1 so i limit it to 0.5 for ball drop animation
    const dropPhase = 0.5;

    if (progress <= dropPhase) {
      // Ball Drop Phase
      // no longer directly use the progress because it only go up to dropPhase
      final localT = progress / dropPhase;
      final startY = center.dy - radius - radiusOffset;
      final endY = center.dy + radius - radiusOffset;

      final liftCurve = math.sin(localT * math.pi);
      final currentY =
          startY - liftHeight * liftCurve + (endY - startY) * localT;

      canvas.drawCircle(Offset(center.dx, currentY), ballRadius, dropPaint);
    } else {
      // Arc Phase
      final localT = (progress - dropPhase) / (1 - dropPhase);

      final startAngle = math.pi / 2;
      final sweep = math.pi * localT;

      // Left arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - radiusOffset),
        startAngle,
        -sweep,
        false,
        fillPaint,
      );

      // Right arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - radiusOffset),
        startAngle,
        sweep,
        false,
        fillPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant InkDropPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
