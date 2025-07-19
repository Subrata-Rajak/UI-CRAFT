import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class StepIndicatorDemo extends StatefulWidget {
  const StepIndicatorDemo({super.key});

  @override
  State<StepIndicatorDemo> createState() => _StepIndicatorDemoState();
}

class _StepIndicatorDemoState extends State<StepIndicatorDemo> {
  int _currentStep = 0;

  final steps = ['Cart', 'Address', 'Payment', 'Done'];

  void _nextStep() {
    if (_currentStep < steps.length - 1) {
      setState(() => _currentStep++);
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step Indicator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            StepIndicator(
              steps: steps,
              currentStep: _currentStep,
              activeColor: Colors.blue,
              completedColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: _prevStep, child: const Text('Back')),
                ElevatedButton(onPressed: _nextStep, child: const Text('Next')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
