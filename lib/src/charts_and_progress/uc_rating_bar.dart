// lib/src/charts/uc_rating_bar.dart

import 'package:flutter/material.dart';
import '../utils/uc_shape_type.dart';
import 'dart:math' as math;

class UcRatingBar extends StatefulWidget {
  final int shapeCount;
  final double rating;
  final ValueChanged<double>? onRatingChanged;
  final double size;
  final bool allowHalfRating;
  final bool isReadOnly;
  final UcShapeType shapeType;
  final Color filledColor;
  final Color filledBorderColor;
  final Color unfilledColor;
  final Color unfilledBorderColor;
  final bool showBorder;
  final double borderWidth;
  final double spacing;
  final bool isVertical;
  final bool animate;

  const UcRatingBar({
    super.key,
    this.shapeCount = 5,
    required this.rating,
    this.onRatingChanged,
    this.size = 32.0,
    this.allowHalfRating = true,
    this.isReadOnly = false,
    this.shapeType = UcShapeType.star,
    this.filledColor = Colors.amber,
    this.filledBorderColor = Colors.orange,
    this.unfilledColor = Colors.grey,
    this.unfilledBorderColor = Colors.black12,
    this.showBorder = true,
    this.borderWidth = 2.0,
    this.spacing = 4.0,
    this.isVertical = false,
    this.animate = true,
  });

  @override
  State<UcRatingBar> createState() => _UcRatingBarState();
}

class _UcRatingBarState extends State<UcRatingBar> {
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  void _handleTap(double value) {
    if (!widget.isReadOnly) {
      setState(() => _currentRating = value);
      widget.onRatingChanged?.call(value);
    }
  }

  void _handleDrag(Offset localPosition, double maxExtent) {
    if (!widget.isReadOnly) {
      final unit = maxExtent / widget.shapeCount;
      double rating = localPosition.dx / unit;
      if (widget.isVertical) rating = localPosition.dy / unit;
      double snapped = widget.allowHalfRating ? (rating * 2).round() / 2 : rating.roundToDouble();
      snapped = snapped.clamp(0, widget.shapeCount.toDouble());
      setState(() => _currentRating = snapped);
      widget.onRatingChanged?.call(snapped);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        final box = context.findRenderObject() as RenderBox;
        final localPos = box.globalToLocal(details.globalPosition);
        final maxExtent = widget.isVertical ? box.size.height : box.size.width;
        _handleDrag(localPos, maxExtent);
      },
      child: Flex(
        direction: widget.isVertical ? Axis.vertical : Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.shapeCount, (index) {
          final value = index + 1;
          final isFilled = _currentRating >= value;
          final isHalf = widget.allowHalfRating && _currentRating >= value - 0.5 && _currentRating < value;

          Widget icon = CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _ShapePainter(
              shapeType: widget.shapeType,
              isFilled: isFilled,
              isHalf: isHalf,
              filledColor: widget.filledColor,
              filledBorderColor: widget.filledBorderColor,
              unfilledColor: widget.unfilledColor,
              unfilledBorderColor: widget.unfilledBorderColor,
              showBorder: widget.showBorder,
              borderWidth: widget.borderWidth,
            ),
          );

          if (widget.animate) {
            icon = AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: icon,
            );
          }

          return GestureDetector(
            onTap: () => _handleTap(value.toDouble()),
            child: Padding(
              padding: EdgeInsets.only(
                right: widget.isVertical ? 0 : (index != widget.shapeCount - 1 ? widget.spacing : 0),
                bottom: widget.isVertical ? (index != widget.shapeCount - 1 ? widget.spacing : 0) : 0,
              ),
              child: icon,
            ),
          );
        }),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  final UcShapeType shapeType;
  final bool isFilled;
  final bool isHalf;
  final Color filledColor;
  final Color filledBorderColor;
  final Color unfilledColor;
  final Color unfilledBorderColor;
  final bool showBorder;
  final double borderWidth;

  _ShapePainter({
    required this.shapeType,
    required this.isFilled,
    required this.isHalf,
    required this.filledColor,
    required this.filledBorderColor,
    required this.unfilledColor,
    required this.unfilledBorderColor,
    required this.showBorder,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = isFilled ? filledColor : unfilledColor;

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = showBorder ? borderWidth : 0
      ..color = isFilled ? filledBorderColor : unfilledBorderColor;

    final path = _getShapePath(size);
    canvas.drawPath(path, paint);
    if (showBorder) canvas.drawPath(path, borderPaint);
  }

  Path _getShapePath(Size size) {
    switch (shapeType) {
      case UcShapeType.heart:
        return _heartPath(size);
      case UcShapeType.circle:
        return Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
      case UcShapeType.square:
        return Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
      case UcShapeType.star:
        return _starPath(size);
    }
  }

  Path _starPath(Size size) {
    const int points = 5;
    final Path path = Path();
    final double outerRadius = size.width / 2;
    final double innerRadius = outerRadius / 2.5;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final angle = (2 * math.pi) / points;

    for (int i = 0; i < points * 2; i++) {
      final r = i.isEven ? outerRadius : innerRadius;
      final x = centerX + r * math.cos(i * angle / 2 - math.pi / 2);
      final y = centerY + r * math.sin(i * angle / 2 - math.pi / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  Path _heartPath(Size size) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;
    path.moveTo(width / 2, height * 0.9);
    path.cubicTo(
      width * 1.1,
      height * 0.6,
      width * 0.8,
      height * 0.1,
      width / 2,
      height * 0.3,
    );
    path.cubicTo(
      width * 0.2,
      height * 0.1,
      -width * 0.1,
      height * 0.6,
      width / 2,
      height * 0.9,
    );
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
