import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart'; // make sure this path resolves correctly

class AnimatedDashboardDemo extends StatefulWidget {
  const AnimatedDashboardDemo({super.key});

  @override
  State<AnimatedDashboardDemo> createState() => _AnimatedDashboardDemoState();
}

class _AnimatedDashboardDemoState extends State<AnimatedDashboardDemo> {
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    // Simulate data fetching
    Timer(const Duration(milliseconds: 500), () {
      setState(() => isReady = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Dashboard'),
      ),
      body: UcAnimatedContent(
        isReady: isReady,
        animationType: UcContentAnimationType.fadeInDown,
        duration: const Duration(milliseconds: 600),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome, Subrata 👋',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Here’s your dashboard overview:', style: TextStyle(fontSize: 16)),

                const SizedBox(height: 24),

                Row(
                  children: [
                    _DashboardCard(
                      icon: Icons.shopping_bag,
                      label: "Orders",
                      value: "128",
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 12),
                    _DashboardCard(
                      icon: Icons.monetization_on,
                      label: "Revenue",
                      value: "₹54,800",
                      color: Colors.green,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),

                Row(
                  children: [
                    _QuickActionButton(icon: Icons.add, label: "New Order"),
                    _QuickActionButton(icon: Icons.analytics, label: "Reports"),
                    _QuickActionButton(icon: Icons.settings, label: "Settings"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _DashboardCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 14, color: color.withOpacity(0.8))),
          ],
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: Colors.black87),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
