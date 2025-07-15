import 'package:flutter/material.dart';
import 'demos/containers/dashed_border_container_demo.dart';
import 'demos/shimmers/shimmer_demo.dart';
// Add more demo imports here

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demoScreens = <String, Widget>{
      'Shimmer Overlay': const ShimmerDemo(),
      'Dashed Border Container': const DashedBorderContainerDemo(),
    };

    return Scaffold(
      appBar: AppBar(title: const Text('UI Draft Demos')),
      body: ListView(
        children: demoScreens.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
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
