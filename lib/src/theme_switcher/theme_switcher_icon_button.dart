import 'package:flutter/material.dart';
import 'theme_switcher_provider.dart';

class ThemeSwitcherIconButton extends StatelessWidget {
  final IconData darkIcon;
  final IconData lightIcon;

  const ThemeSwitcherIconButton({
    super.key,
    this.darkIcon = Icons.dark_mode,
    this.lightIcon = Icons.light_mode,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ThemeSwitcher.of(context);

    // If using system theme, hide toggle button
    if (controller.useSystemTheme) {
      return const SizedBox.shrink();
    }

    return IconButton(
      onPressed: controller.toggleTheme,
      icon: Icon(
        controller.isDark ? darkIcon : lightIcon,
      ),
    );
  }
}
