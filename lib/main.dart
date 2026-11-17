
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/storage/app_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreferences.init();
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
