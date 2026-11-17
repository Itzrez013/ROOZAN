import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/storage/app_preferences.dart';
import 'features/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreferences.init();
  runApp(const RoozanApp());
}

class RoozanApp extends StatefulWidget {
  const RoozanApp({super.key});

  @override
  State<RoozanApp> createState() => _RoozanAppState();
}

class _RoozanAppState extends State<RoozanApp> {
  bool _onboardingCompleted = AppPreferences.onboardingCompleted;

  Future<void> _completeOnboarding(String userName) async {
    await AppPreferences.setUserName(userName);
    await AppPreferences.setOnboardingCompleted(true);
    if (mounted) {
      setState(() => _onboardingCompleted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'روزان',

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      themeMode: ThemeMode.dark,

      home: _onboardingCompleted
          ? const _HomeScreen()
          : OnboardingScreen(onComplete: _completeOnboarding),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('به روزان خوش آمدید، ${AppPreferences.userName}!'),
      ),
    );
  }
}
