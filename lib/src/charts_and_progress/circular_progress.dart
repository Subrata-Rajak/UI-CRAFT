// lib/src/charts/uc_circular_progress.dart

import 'package:flutter/material.dart';

class UcCircularProgress extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final double size;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animationDuration;
  final Widget? center;

  const UcCircularProgress({
    super.key,
    required this.value,
    this.size = 100,
    this.strokeWidth = 8,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = Colors.blue,
    this.animationDuration = const Duration(milliseconds: 600),
    this.center,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: value.clamp(0.0, 1.0)),
      duration: animationDuration,
      builder: (context, animatedValue, child) {
        return SizedBox(
          height: size,
          width: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: animatedValue,
                strokeWidth: strokeWidth,
                backgroundColor: backgroundColor,
                valueColor: AlwaysStoppedAnimation(progressColor),
              ),
              if (center != null) center!,
            ],
          ),
        );
      },
    );
  }
}
