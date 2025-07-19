import 'dart:ui';

import 'package:flutter/material.dart';

class UcDashedBorderContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double width;
  final double height;
  final Alignment alignment;

  const UcDashedBorderContainer({
    super.key,
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.dashGap = 3.0,
    this.borderRadius = BorderRadius.zero,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = double.infinity,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      alignment: alignment,
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: color,
          strokeWidth: strokeWidth,
          dashWidth: dashWidth,
          dashGap: dashGap,
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final BorderRadius borderRadius;

  _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashGap,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect outer = borderRadius.toRRect(Offset.zero & size);
    final Path path = Path()..addRRect(outer);

    final PathMetrics metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final Path extract = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extract, paint);
        distance += dashWidth + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashGap != dashGap ||
        oldDelegate.borderRadius != borderRadius;
  }
}
