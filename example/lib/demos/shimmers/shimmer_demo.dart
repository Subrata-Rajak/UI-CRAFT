import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class ShimmerDemo extends StatelessWidget {
  const ShimmerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shimmer Overlay Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ShimmerOverlay(
          isLoading: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20, width: 200, color: Colors.grey[300]),
              const SizedBox(height: 10),
              Container(height: 20, width: 150, color: Colors.grey[300]),
              const SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.grey[300]),
                  const SizedBox(width: 10),
                  Container(height: 20, width: 100, color: Colors.grey[300]),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
