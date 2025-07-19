// ui_craft content entrance animation components

import 'package:flutter/material.dart';

import '../utils/uc_list_animation_type.dart';

class UcAnimatedGrid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final UcListAnimationType animationType;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const UcAnimatedGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.animationType = UcListAnimationType.fade,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 100),
    this.curve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: children.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return _UcAnimatedItem(
          child: children[index],
          index: index,
          animationType: animationType,
          duration: duration,
          delay: delay,
          curve: curve,
        );
      },
    );
  }
}

class _UcAnimatedItem extends StatefulWidget {
  final Widget child;
  final int index;
  final UcListAnimationType animationType;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const _UcAnimatedItem({
    required this.child,
    required this.index,
    required this.animationType,
    required this.duration,
    required this.delay,
    required this.curve,
  });

  @override
  State<_UcAnimatedItem> createState() => _UcAnimatedItemState();
}

class _UcAnimatedItemState extends State<_UcAnimatedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  late Animation<double> _scale;

  bool _visible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    _slide = Tween(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    _scale = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    Future.delayed(widget.delay * widget.index, () {
      if (mounted) {
        setState(() => _visible = true);
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget animatedChild = widget.child;

    switch (widget.animationType) {
      case UcListAnimationType.fade:
        animatedChild = FadeTransition(
          opacity: _opacity,
          child: widget.child,
        );
        break;
      case UcListAnimationType.slide:
        animatedChild = SlideTransition(
          position: _slide,
          child: widget.child,
        );
        break;
      case UcListAnimationType.scale:
        animatedChild = ScaleTransition(
          scale: _scale,
          child: widget.child,
        );
        break;
      case UcListAnimationType.bounce:
        final bounce = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
        );
        animatedChild = ScaleTransition(
          scale: bounce,
          child: widget.child,
        );
        break;
      case UcListAnimationType.staggered:
        animatedChild = SlideTransition(
          position: _slide,
          child: FadeTransition(
            opacity: _opacity,
            child: ScaleTransition(
              scale: _scale,
              child: widget.child,
            ),
          ),
        );
        break;
    }

    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: widget.duration,
      child: animatedChild,
    );
  }
}