import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/uc_content_animation_type.dart';

class UcAnimatedContent extends StatefulWidget {
  final bool isReady;
  final Widget child;
  final Duration duration;
  final UcContentAnimationType animationType;
  final Curve curve;

  const UcAnimatedContent({
    super.key,
    required this.isReady,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.animationType = UcContentAnimationType.fadeIn,
    this.curve = Curves.easeOut,
  });

  @override
  State<UcAnimatedContent> createState() => _UcAnimatedContentState();
}

class _UcAnimatedContentState extends State<UcAnimatedContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;
  late final Animation<double> _scale;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _offset = Tween<Offset>(
      begin: _getOffsetBegin(widget.animationType),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _scale = Tween<double>(
      begin: _getScaleBegin(widget.animationType),
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _rotation = Tween<double>(
      begin: widget.animationType == UcContentAnimationType.rotateIn
          ? math.pi / 8
          : 0,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void didUpdateWidget(covariant UcAnimatedContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isReady && !_controller.isCompleted) {
      _controller.forward();
    }
  }

  Offset _getOffsetBegin(UcContentAnimationType type) {
    switch (type) {
      case UcContentAnimationType.slideUp:
      case UcContentAnimationType.fadeInUp:
        return const Offset(0, 0.1);
      case UcContentAnimationType.slideDown:
      case UcContentAnimationType.fadeInDown:
        return const Offset(0, -0.1);
      case UcContentAnimationType.slideLeft:
        return const Offset(1.0, 0);
      case UcContentAnimationType.slideRight:
        return const Offset(-1.0, 0);
      default:
        return Offset.zero;
    }
  }

  double _getScaleBegin(UcContentAnimationType type) {
    switch (type) {
      case UcContentAnimationType.scaleIn:
        return 0.9;
      case UcContentAnimationType.zoomIn:
        return 0.7;
      default:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        Widget animated = widget.child;

        // Fade
        if (_usesOpacity(widget.animationType)) {
          animated = Opacity(opacity: _opacity.value, child: animated);
        }

        // Slide
        if (_usesSlide(widget.animationType)) {
          animated = SlideTransition(position: _offset, child: animated);
        }

        // Scale
        if (_usesScale(widget.animationType)) {
          animated = ScaleTransition(scale: _scale, child: animated);
        }

        // Rotate
        if (widget.animationType == UcContentAnimationType.rotateIn) {
          animated = Transform.rotate(angle: _rotation.value, child: animated);
        }

        return animated;
      },
    );
  }

  bool _usesOpacity(UcContentAnimationType type) {
    return [
      UcContentAnimationType.fadeIn,
      UcContentAnimationType.fadeInUp,
      UcContentAnimationType.fadeInDown,
      UcContentAnimationType.scaleIn,
      UcContentAnimationType.zoomIn,
      UcContentAnimationType.rotateIn,
    ].contains(type);
  }

  bool _usesSlide(UcContentAnimationType type) {
    return [
      UcContentAnimationType.slideUp,
      UcContentAnimationType.slideDown,
      UcContentAnimationType.slideLeft,
      UcContentAnimationType.slideRight,
      UcContentAnimationType.fadeInUp,
      UcContentAnimationType.fadeInDown,
    ].contains(type);
  }

  bool _usesScale(UcContentAnimationType type) {
    return [
      UcContentAnimationType.scaleIn,
      UcContentAnimationType.zoomIn,
    ].contains(type);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
