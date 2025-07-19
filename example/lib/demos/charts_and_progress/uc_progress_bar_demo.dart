// example/lib/demos/charts/uc_progress_bar_demo.dart

import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class UcProgressBarDemo extends StatefulWidget {
  const UcProgressBarDemo({super.key});

  @override
  State<UcProgressBarDemo> createState() => _UcProgressBarDemoState();
}

class _UcProgressBarDemoState extends State<UcProgressBarDemo> {
  double _progress = 0.3;

  void _updateProgress() {
    setState(() {
      _progress += 0.1;
      if (_progress > 1.0) _progress = 0.0;
    });
  }

  void _resetProgress() {
    setState(() {
      _progress = 0.0;
    });
  }

  void _decreaseProgress() {
    setState(() {
      _progress -= 0.1;
      if (_progress < 0.0) _progress = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UcProgressBar Demo')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UcProgressBar(
              value: _progress,
              height: 14,
              progressColor: Colors.teal,
              label: Text('Progress: ${(_progress * 100).toInt()}%'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _updateProgress,
              child: const Text('Increase Progress'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetProgress,
              child: const Text('Reset Progress'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _decreaseProgress,
              child: const Text('Decrease Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
