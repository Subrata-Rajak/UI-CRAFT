import 'package:example/home.dart';
import 'package:flutter/material.dart';
import 'package:ui_craft/ui_craft.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWrapper(
      useSystemTheme: false,
      builder: (context, isDark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: const HomeScreen(),
        );
      },
    );
  }
}
