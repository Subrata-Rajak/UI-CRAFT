// lib/src/charts/uc_progress_bar.dart

import 'package:flutter/material.dart';

class UcProgressBar extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animationDuration;
  final BorderRadius borderRadius;
  final Widget? label;

  const UcProgressBar({
    super.key,
    required this.value,
    this.height = 10.0,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = const Color(0xFF3F51B5),
    this.animationDuration = const Duration(milliseconds: 500),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: label!,
        ),
        ClipRRect(
          borderRadius: borderRadius,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    height: height,
                    color: backgroundColor,
                  ),
                  AnimatedContainer(
                    duration: animationDuration,
                    curve: Curves.easeInOut,
                    width: constraints.maxWidth * value.clamp(0.0, 1.0),
                    height: height,
                    color: progressColor,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
