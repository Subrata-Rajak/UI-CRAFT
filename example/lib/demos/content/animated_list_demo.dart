import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class AnimatedListDemo extends StatelessWidget {
  const AnimatedListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uc Animated List Demo')),
      body: UcAnimatedList(
        animationType: UcListAnimationType.staggered,
        duration: const Duration(milliseconds: 400),
        children: List.generate(10, (index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.indigo,
            child: SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
