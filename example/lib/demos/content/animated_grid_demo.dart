import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class AnimatedGridDemo extends StatelessWidget {
  const AnimatedGridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uc Animated Grid Demo')),
      body: UcAnimatedGrid(
          animationType: UcListAnimationType.bounce,
          crossAxisCount: 2,
          children: List.generate(8, (index) {
            return Card(
              color: Colors.deepOrange,
              child: Center(
                child: Text(
                  'Tile ${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          }),
        ),
      );
  }
}