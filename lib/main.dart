
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const RoozanApp());
}

class RoozanApp extends StatelessWidget {
  const RoozanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'روزان',

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      themeMode: ThemeMode.light,

      home: const Scaffold(
        body: Center(
          child: Text('به روزان خوش آمدید!'),
        ),
      ),
    );
  }
}
