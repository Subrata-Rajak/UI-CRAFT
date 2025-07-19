// example/lib/demos/charts/uc_circular_progress_demo.dart

import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class UcCircularProgressDemo extends StatefulWidget {
  const UcCircularProgressDemo({super.key});

  @override
  State<UcCircularProgressDemo> createState() => _UcCircularProgressDemoState();
}

class _UcCircularProgressDemoState extends State<UcCircularProgressDemo> {
  double _progress = 0.5;

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
      appBar: AppBar(title: const Text('UcCircularProgress Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UcCircularProgress(
              value: _progress,
              size: 120,
              strokeWidth: 10,
              progressColor: Colors.orange,
              center: Text(
                '${(_progress * 100).toInt()}%',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
