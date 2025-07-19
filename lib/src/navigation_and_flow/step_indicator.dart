import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> steps;
  final Color activeColor;
  final Color completedColor;
  final Color inactiveColor;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.steps,
    this.activeColor = Colors.green,
    this.completedColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isEven) {
          final stepIndex = index ~/ 2;
          final isActive = stepIndex == currentStep;
          final isCompleted = stepIndex < currentStep;

          return Expanded(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isActive
                        ? activeColor
                        : isCompleted
                            ? completedColor
                            : inactiveColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${stepIndex + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  steps[stepIndex],
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          final isCompleted = index ~/ 2 < currentStep;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  begin: inactiveColor.withValues(alpha: 0.3),
                  end: isCompleted ? completedColor : inactiveColor.withValues(alpha: 0.3),
                ),
                duration: const Duration(milliseconds: 300),
                builder: (context, color, child) {
                  return Container(
                    height: 2,
                    color: color,
                  );
                },
              ),
            ),
          );
        }
      }),
    );
  }
}
