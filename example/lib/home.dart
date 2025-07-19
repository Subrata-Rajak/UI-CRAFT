import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';
import 'demos/charts_and_progress/uc_circular_progress_demo.dart';
import 'demos/charts_and_progress/uc_progress_bar_demo.dart';
import 'demos/charts_and_progress/uc_rataing_bar_demo.dart';
import 'demos/containers/dashed_border_container_demo.dart';
import 'demos/content/animated_content_demo.dart';
import 'demos/content/animated_grid_demo.dart';
import 'demos/content/animated_list_demo.dart';
import 'demos/navigation_and_flow/step_indicator_demo.dart';
import 'demos/shimmers/shimmer_demo.dart';
// Add more demo imports here

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeSwitcher.of(context).isDark;
    final demoScreens = <String, Widget>{
      'Shimmer Overlay': const ShimmerDemo(),
      'Dashed Border Container': const DashedBorderContainerDemo(),
      'Animated Content': const AnimatedDashboardDemo(),
      'Animated List': const AnimatedListDemo(),
      'Animated Grid': const AnimatedGridDemo(),
      'Progress Bar': const UcProgressBarDemo(),
      'Circular Progress': const UcCircularProgressDemo(),
      'Rating Bar': const UcRatingBarDemo(),
      'Step Indicator': const StepIndicatorDemo(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Draft Demos'),
        actions: [
          ThemeSwitcherIconButton()
        ],
      ),
      body: ListView(
        children: demoScreens.entries.map((entry) {
          return ListTile(
            title: Text(
              entry.key,
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => entry.value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
