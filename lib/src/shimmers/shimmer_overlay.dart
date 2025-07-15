// lib/shimmer_overlay.dart

import 'package:flutter/material.dart';

import 'shimmer_gradient_transform.dart';

class ShimmerOverlay extends StatefulWidget {
  final bool isLoading;
  final Widget child;

  const ShimmerOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  State<ShimmerOverlay> createState() => _ShimmerOverlayState();
}

class _ShimmerOverlayState extends State<ShimmerOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween(begin: -1.0, end: 2.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return widget.child;

    return Stack(
      children: [
        Opacity(opacity: 0.0, child: widget.child),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.grey.shade300,
                      Colors.grey.shade100,
                      Colors.grey.shade300,
                    ],
                    stops: const [0.1, 0.5, 0.9],
                    transform: SlidingGradientTransform(
                      slidePercent: _animation.value,
                    ),
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: widget.child,
              );
            },
          ),
        ),
      ],
    );
  }
}

