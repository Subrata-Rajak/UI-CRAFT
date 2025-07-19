import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class DashedBorderContainerDemo extends StatelessWidget {
  const DashedBorderContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashed Border Container Demo')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UcDashedBorderContainer(
              width: 100,
              height: 40,
              color: Colors.red,
              strokeWidth: 2,
              dashWidth: 5,
              dashGap: 3,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  'Hello World',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const UcDashedBorderContainer(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              color: Colors.yellow,
              strokeWidth: 3,
              dashWidth: 100,
              dashGap: 15,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  'Hello World',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}