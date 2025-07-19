// example/lib/demos/charts/uc_rating_bar_custom_shapes_demo.dart

import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class UcRatingBarDemo extends StatefulWidget {
  const UcRatingBarDemo({super.key});

  @override
  State<UcRatingBarDemo> createState() => _UcRatingBarDemoState();
}

class _UcRatingBarDemoState extends State<UcRatingBarDemo> {
  double rating1 = 3;
  double rating2 = 4.5;
  double rating3 = 4.5;
  double rating4 = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UcRatingBar Demo')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Star Rating'), 
            const SizedBox(height: 10),
            UcRatingBar(
              rating: rating1,
              shapeCount: 6,
              spacing: 10,
              onRatingChanged: (r) => setState(() => rating1 = r),
              shapeType: UcShapeType.star,
              showBorder: true,
              filledColor: Colors.pink.shade100,
              filledBorderColor: Colors.pink,
              unfilledColor: Colors.white,
              unfilledBorderColor: Colors.pink.shade200,
            ),
            const SizedBox(height: 20),
            const Text('Heart Rating'),
            const SizedBox(height: 10),
            UcRatingBar(
              rating: rating2,
              shapeCount: 6,
              spacing: 10,
              onRatingChanged: (r) => setState(() => rating2 = r),
              shapeType: UcShapeType.heart,
              showBorder: true,
              borderWidth: 2,
              filledColor: Colors.pink.shade100,
              filledBorderColor: Colors.pink,
              unfilledColor: Colors.white,
              unfilledBorderColor: Colors.pink.shade200,
            ),
            const SizedBox(height: 20),
            const Text('Circle Rating'),
            const SizedBox(height: 10),
            UcRatingBar(
              rating: rating3,
              shapeCount: 6,
              spacing: 10,
              onRatingChanged: (r) => setState(() => rating3 = r),
              shapeType: UcShapeType.circle,
              showBorder: true,
              borderWidth: 2,
              filledColor: Colors.pink.shade100,
              filledBorderColor: Colors.pink,
              unfilledColor: Colors.white,
              unfilledBorderColor: Colors.pink.shade200,
            ),
            const SizedBox(height: 20),
            const Text('Square Rating'),
            const SizedBox(height: 10),
            UcRatingBar(
              rating: rating4,
              shapeCount: 6,
              spacing: 10,
              onRatingChanged: (r) => setState(() => rating4 = r),
              shapeType: UcShapeType.square,
              showBorder: true,
              borderWidth: 2,
              filledColor: Colors.pink.shade100,
              filledBorderColor: Colors.pink,
              unfilledColor: Colors.white,
              unfilledBorderColor: Colors.pink.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
