import 'package:flutter/material.dart';
import 'theme_switcher_provider.dart';

class ThemeSwitcherToggleButton extends StatelessWidget {
  final Color activeColor;
  final Color inactiveThumbColor;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final Color thumbColor;
  final bool autofocus;

  const ThemeSwitcherToggleButton({
    super.key,
    this.activeColor = Colors.white,
    this.inactiveThumbColor = Colors.grey,
    this.activeTrackColor = Colors.black,
    this.inactiveTrackColor = Colors.grey,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.thumbColor = Colors.white,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ThemeSwitcher.of(context);

    if (controller.useSystemTheme) {
      return const SizedBox.shrink();
    }

    return Switch(
      value: controller.isDark,
      onChanged: (_) => controller.toggleTheme(),
      activeColor: activeColor,
      inactiveThumbColor: inactiveThumbColor,
      activeTrackColor: activeTrackColor,
      inactiveTrackColor: inactiveTrackColor,
      activeThumbImage: activeThumbImage,
      inactiveThumbImage: inactiveThumbImage,
      thumbColor: WidgetStateProperty.all(thumbColor),
      trackColor: WidgetStateProperty.all(activeTrackColor),
      autofocus: autofocus,
      
    );
  }
}
