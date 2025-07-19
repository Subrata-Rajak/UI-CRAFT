import 'package:flutter/material.dart';
import 'theme_switcher_controller.dart';
import 'theme_switcher_provider.dart';

class ThemeSwitcherWrapper extends StatefulWidget {
  final Widget Function(BuildContext context, bool isDark) builder;
  final bool useSystemTheme;

  const ThemeSwitcherWrapper({
    super.key,
    required this.builder,
    this.useSystemTheme = true,
  });

  @override
  State<ThemeSwitcherWrapper> createState() => _ThemeSwitcherWrapperState();
}

class _ThemeSwitcherWrapperState extends State<ThemeSwitcherWrapper> {
  late ThemeSwitcherController controller;

  @override
  void initState() {
    super.initState();
    controller = ThemeSwitcherController(useSystemTheme: widget.useSystemTheme);
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      controller: controller,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => widget.builder(context, controller.isDark),
      ),
    );
  }
}
