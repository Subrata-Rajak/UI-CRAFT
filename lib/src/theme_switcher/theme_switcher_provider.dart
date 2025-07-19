import 'package:flutter/material.dart';
import 'theme_switcher_controller.dart';

class ThemeSwitcher extends InheritedNotifier<ThemeSwitcherController> {
  const ThemeSwitcher({
    super.key,
    required ThemeSwitcherController controller,
    required super.child,
  }) : super(notifier: controller);

  static ThemeSwitcherController of(BuildContext context) {
    final ThemeSwitcher? inherited = context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>();
    if (inherited == null) {
      throw FlutterError(
        'ThemeSwitcher.of() called with a context that does not contain a ThemeSwitcher.',
      );
    }
    return inherited.notifier!;
  }

  @override
  bool updateShouldNotify(covariant ThemeSwitcher oldWidget) => true;
}
